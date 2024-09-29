using Pkg
Pkg.activate(".")
include("../src/GamePieces.jl")
using .GamePieces

d = Standard52DeckCards()
dv = cards_as_vector(d) 
sd = shuffle_deck!(dv) |> opened_deck

decks = []
push!(decks,dv)
for i in 1:10
    dv = shuffle_deck!(dv) 
    push!(decks,deepcopy(dv))
end
decks



