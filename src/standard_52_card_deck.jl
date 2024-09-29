abstract type AbstractgamePieces end
mutable struct Standard52DeckCards <: AbstractgamePieces
    cards::Union{
        Base.Iterators.ProductIterator{Tuple{Vector{String}, Vector{String}}},
        Matrix{String},
        Vector{String}}


    function Standard52DeckCards()
        suits = ["♡", "♢" , "♣", "♠"]
        ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        cards = Iterators.product(ranks, suits)
        new(cards)  # Create a new instance with the cards iterator
    end
    function Standard52DeckCards(deck::Union{Matrix{String},Vector{String}})
        new(deck)
    end
end

function cards_as_matrix(deck::Standard52DeckCards)
    deck |> 
    opened_deck |>
    collect |> 
    x -> join.(x) |>
    Standard52DeckCards
end


function cards_as_vector(deck::Standard52DeckCards)
    cards_as_matrix(deck) |>
    opened_deck |>
    x -> reduce(vcat,x) |>
    Standard52DeckCards
end

function opened_deck(deck::Standard52DeckCards)
    deck.cards
end


function shuffle_deck!(deck::Standard52DeckCards)
    cards = opened_deck(deck)
    if !(cards isa Vector{String})
        if cards isa Base.Iterators.ProductIterator
            cards = cards_as_vector(deck) |> opened_deck
        elseif  cards isa Matrix
            cards = cards_as_vector(deck) |> opened_deck
        end
    end
    n = length(cards)
    @assert n == 52 "Single deck of 52 cards at the moment only!, not $(n)"
    n == 0 && return deck
    for i in reverse(Base.OneTo(n))
        j = rand(1:i)
        cards[i],cards[j] = cards[j],cards[i]
    end
    Standard52DeckCards(cards)
end








