import typer

from {{cookiecutter.__project_name_snake}} import hello as _hello

app = typer.Typer()


@app.command()
def hello() -> None:
    _hello()


def main() -> None:
    app()

if __name__ == "__main__":
    main()