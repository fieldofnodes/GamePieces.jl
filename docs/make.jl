using GamePieces
using Documenter

DocMeta.setdocmeta!(GamePieces, :DocTestSetup, :(using GamePieces); recursive=true)

makedocs(;
    modules=[GamePieces],
    authors="Jonathan Miller jonathan.miller@fieldofnodes.com",
    sitename="GamePieces.jl",
    format=Documenter.HTML(;
        canonical="https://fieldofnodes.github.io/GamePieces.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/fieldofnodes/GamePieces.jl",
    devbranch="main",
)
