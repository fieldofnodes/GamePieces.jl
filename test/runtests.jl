using GamePieces

using Test


@testset "GamePieces.jl" begin
    d = Standard52DeckCards()
    @test d isa Standard52DeckCards
    dm = cards_as_matrix(d)
    @test dm isa Standard52DeckCards
    dv = cards_as_vector(d)
    @test d isa Standard52DeckCards
    sd = shuffle_deck!(d) 
    @test sd isa Standard52DeckCards
    sdm = shuffle_deck!(dm) 
    @test sdm isa Standard52DeckCards
    sdv = shuffle_deck!(dv)
    @test sdv isa Standard52DeckCards
    @test sd |> opened_deck isa Vector
    @test sdm |> opened_deck isa Vector
    @test sdv |> opened_deck isa Vector
    
end
