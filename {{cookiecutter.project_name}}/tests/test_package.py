def test_import() -> None:
    from {{cookiecutter.__project_name_snake}} import hello

    assert hello() is None
