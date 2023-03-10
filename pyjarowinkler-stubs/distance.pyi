def get_jaro_distance(first: str, second: str, winkler: bool = ...,
                      winkler_ajustment: bool = ..., scaling: float = ...) -> float: ...


def _score(first: str, second: str) -> float: ...


def _get_diff_index(first: str, second: str) -> int: ...


def _get_prefix(first: str, second: str) -> str: ...


def _get_matching_characters(first: str, second: str) -> str: ...


def _transpositions(first: str, second: str) -> int: ...


class JaroDistanceException(Exception):
  def __init__(self, message: str) -> None: ...
