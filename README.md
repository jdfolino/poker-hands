# Poker Hands

In the card game poker, a hand consists of five cards.


## Card and Hand Representations

In this exercise, cards are represented as two character strings: the first character representing the value of the card and the second representing the suite.

values: 2, 3, 4, 5, 6, 7, 8, 9, 0 (10), J (Jack), Q (Queen), K (King), A (Ace).
suites: H (Hearts), D (Diamonds), C (Clubs), S (Spades)

For example, '2H' is the two of hearts, '0D' is the 10 of diamonds, 'JC' is the Jack of Clubs.


## Hand Representations

In this exercise, hands are represented as a string of 5 two character card strings separated by spaces.
For example, '2H 2D 2C 2S JD' represents the hand four twos and the jack of diamonds.


## Hand Categories

These are all of the categories that poker hands can fall into, in order of lowest to highest scoring:

* High Card: Highest value card.
* One Pair: Two cards of the same value.
* Two Pairs: Two different pairs.
* Three of a Kind: Three cards of the same value.
* Straight: All cards are consecutive values.
* Flush: All cards of the same suit.
* Full House: Three of a kind and a pair.
* Four of a Kind: Four cards of the same value.
* Straight Flush: All cards are consecutive values of same suit.
* Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.

## A note about the Ace card

Ace can be high or low but not both.

Ace, 2, 3, 4, 5 is a straight.
10, Jack, Queen, King, Ace is a straight.
Queen, King, Ace, 2, 3 is NOT a straight.

## Poker Hand validation

Hands are invalid if any given hand or combination of given hands could not possibly arise from a standard 52 card deck. For example, if more than 4 aces appear across all hands.

A hand is also invalid if it does not contain exactly five cards.

