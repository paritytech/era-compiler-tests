from typing import TypedDict, Optional, cast
import json, os, copy, itertools


class Input(TypedDict):
    caller: Optional[str]


class Case(TypedDict):
    inputs: list[Input]


class Metadata(TypedDict):
    cases: list[Case]


PRIVATE_KEY_TO_ACCOUNT_MAPPING: dict[str, str] = {
    "0x0000000000000000000000000000000000000000000000000000000000000001": "0x7E5F4552091A69125d5DfCb7b8C2659029395Bdf",
    "0x0000000000000000000000000000000000000000000000000000000000000002": "0x2B5AD5c4795c026514f8317c7a215E218DcCD6cF",
    "0x0000000000000000000000000000000000000000000000000000000000000003": "0x6813Eb9362372EEF6200f3b1dbC3f819671cBA69",
    "0x0000000000000000000000000000000000000000000000000000000000000004": "0x1efF47bc3a10a45D4B230B5d10E37751FE6AA718",
    "0x0000000000000000000000000000000000000000000000000000000000000005": "0xe1AB8145F7E55DC933d51a18c793F901A3A0b276",
    "0x0000000000000000000000000000000000000000000000000000000000000006": "0xE57bFE9F44b819898F47BF37E5AF72a0783e1141",
    "0x0000000000000000000000000000000000000000000000000000000000000007": "0xd41c057fd1c78805AAC12B0A94a405c0461A6FBb",
    "0x0000000000000000000000000000000000000000000000000000000000000008": "0xF1F6619B38A98d6De0800F1DefC0a6399eB6d30C",
    "0x0000000000000000000000000000000000000000000000000000000000000009": "0xF7Edc8FA1eCc32967F827C9043FcAe6ba73afA5c",
    "0x000000000000000000000000000000000000000000000000000000000000000a": "0x4CCeBa2d7D2B4fdcE4304d3e09a1fea9fbEb1528",
    "0x000000000000000000000000000000000000000000000000000000000000000b": "0x3DA8D322CB2435dA26E9C9fEE670f9fB7Fe74E49",
    "0x000000000000000000000000000000000000000000000000000000000000000c": "0xDbc23AE43a150ff8884B02Cea117b22D1c3b9796",
    "0x000000000000000000000000000000000000000000000000000000000000000d": "0x68E527780872cda0216Ba0d8fBD58b67a5D5e351",
    "0x000000000000000000000000000000000000000000000000000000000000000e": "0x5A83529ff76Ac5723A87008c4D9B436AD4CA7d28",
    "0x000000000000000000000000000000000000000000000000000000000000000f": "0x8735015837bD10e05d9cf5EA43A2486Bf4Be156F",
    "0x0000000000000000000000000000000000000000000000000000000000000010": "0xfaE394561e33e242c551d15D4625309EA4c0B97f",
    "0x0000000000000000000000000000000000000000000000000000000000000011": "0x252Dae0A4b9d9b80F504F6418acd2d364C0c59cD",
    "0x0000000000000000000000000000000000000000000000000000000000000012": "0x79196B90D1E952C5A43d4847CAA08d50b967c34A",
    "0x0000000000000000000000000000000000000000000000000000000000000013": "0x4bd1280852Cadb002734647305AFC1db7ddD6Acb",
    "0x0000000000000000000000000000000000000000000000000000000000000014": "0x811da72aCA31e56F770Fc33DF0e45fD08720E157",
    "0x0000000000000000000000000000000000000000000000000000000000000015": "0x157bFBEcd023fD6384daD2Bded5DAD7e27Bf92E4",
    "0x0000000000000000000000000000000000000000000000000000000000000016": "0x37dA28C050E3c0A1c0aC3BE97913EC038783dA4C",
    "0x0000000000000000000000000000000000000000000000000000000000000017": "0x3Bc8287F1D872df4217283b7920D363F13Cf39D8",
    "0x0000000000000000000000000000000000000000000000000000000000000018": "0xf4e2B0fcbd0DC4b326d8A52B718A7bb43BdBd072",
    "0x0000000000000000000000000000000000000000000000000000000000000019": "0x9a5279029e9A2D6E787c5A09CB068AB3D45e209d",
    "0x000000000000000000000000000000000000000000000000000000000000001a": "0xc39677F5F47d5fE65ab24e66750e8FCa127c15BE",
    "0x000000000000000000000000000000000000000000000000000000000000001b": "0x1dc728786E09F862E39Be1f39dD218EE37feB68D",
    "0x000000000000000000000000000000000000000000000000000000000000001c": "0x636CC65783084b9F370789c90F733DBBeb88925D",
    "0x000000000000000000000000000000000000000000000000000000000000001d": "0x4a7A7c2E09209dbE44A582cD92b0eDd7129E74be",
    "0x000000000000000000000000000000000000000000000000000000000000001e": "0xA56160A359F2EAa66f5c9df5245542B07339A9a6",
}

EXTENSION_TO_COMMENT_SEQUENCE_MAPPING: dict[str, str] = {
    ".json": "",
    ".sol": "//!",
    ".yul": "//!",
    ".vy": "#!",
    ".ll": ";!",
}


def main() -> None:
    SCRIPT_DIRECTORY: str = os.path.dirname(os.path.realpath(__file__))

    for directory_path, _, file_names in os.walk(SCRIPT_DIRECTORY):
        for file_name in file_names:
            file_path: str = os.path.join(directory_path, file_name)
            file_extension: str = os.path.splitext(file_path)[1]

            with open(file_path, "r") as file:
                try:
                    file_content: str = file.read()
                except:
                    continue

            if (
                maybe_comment_sequence := EXTENSION_TO_COMMENT_SEQUENCE_MAPPING.get(
                    file_extension
                )
            ) is None:
                continue
            comment_sequence: str = cast(str, maybe_comment_sequence)  # type: ignore

            content: str = "\n".join(
                map(
                    lambda line: line.replace(comment_sequence, ""),
                    itertools.takewhile(
                        lambda line: line.startswith(comment_sequence),
                        file_content.split("\n"),
                    ),
                )
            ).strip()

            if content == "":
                continue

            metadata: Metadata = json.loads(content)
            original_metadata: Metadata = copy.deepcopy(metadata)
            for idx, case in enumerate(metadata["cases"]):
                case_serialized: str = json.dumps(case)

                callers: set[str] = set(
                    [
                        cast(
                            str,
                            input.get(
                                "caller", "0xdeadbeef01000000000000000000000000000000"
                            ),
                        )
                        for input in case["inputs"]
                    ]
                )

                replacement_map: dict[str, str] = {
                    old.removeprefix("0x"): new.removeprefix("0x")
                    for old, new in zip(
                        callers, PRIVATE_KEY_TO_ACCOUNT_MAPPING.values()
                    )
                }

                replacement_map["deadbeef01000000000000000000000000000000"] = (
                    "90F8bf6A479f320ead074411a4B0e7944Ea8c9C1"
                )

                for old, new in replacement_map.items():
                    case_serialized = case_serialized.replace(old, new)

                metadata["cases"][idx] = json.loads(case_serialized)

            lines_to_replace: str = "\n".join(
                itertools.takewhile(
                    lambda line: line.startswith(comment_sequence),
                    file_content.split("\n"),
                )
            )
            lines_to_replace_with: str = "\n".join(
                map(
                    lambda line: f"{comment_sequence}{line}",
                    json.dumps(metadata, indent=4).split("\n"),
                )
            )

            if metadata != original_metadata:
                with open(file_path, "w") as file:
                    file.write(
                        file_content.replace(lines_to_replace, lines_to_replace_with)
                    )


if __name__ == "__main__":
    main()
