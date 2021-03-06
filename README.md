# Setup

*Assumes Ruby 2.6.2 and bundler are installed on your machine*

1. Clone the repo from GitHub (`git clone git@github.com:groeneman/gilded-rose.git`)
2. `cd gilded-rose`
3. `bundle` to install dependencies
4. `rspec` to ensure the tests run. You should see a failing test. 
5. `ruby texttest_fixture.rb` to run the TextTest

# Instructions

*Hi and welcome to team Gilded Rose. As you know, we are a small store with a prime location in a prominent city ran by a friendly shopkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:*

* All items have a `SellIn` value which denotes the number of days we have to sell the item
* All items have a `Quality` value which denotes how valuable the item is
* At the end of each day our system lowers both values for every item

*Pretty simple, right? Well this is where it gets interesting:*

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- “Aged Brie” actually increases in `Quality` the older it gets
- The Quality of an item is never more than 50
- “Sulfuras, Hand of Ragnaros”, being a legendary item, never has to be sold or decreases in Quality
- “Backstage passes to a TAFKAL80ETC concert”, like aged brie, increases in `Quality` as it’s `SellIn` value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

*We have recently signed a supplier of conjured items. This requires an update to our system:*

- “Conjured” items degrade in `Quality` twice as fast as normal items

Feel free to make any changes to the `UpdateQuality` method and add any new code as long as everything still works correctly. However, do not alter the `Item` class as it belongs to the goblin in the corner who will insta-rage as he doesn’t believe in shared code ownership.

# [Slide Deck](https://docs.google.com/presentation/d/1vRrEkQvrQqNoQ5mY9MLzUKOqSKG2u_qis40jlg477zs)
