module GamePieces

    export 
        AbstractgamePieces,
        Standard52DeckCards,
        cards_as_matrix,
        cards_as_vector,
        shuffle_deck!,
        opened_deck

    include("standard_52_card_deck.jl")


end
