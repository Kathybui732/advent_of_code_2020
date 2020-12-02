# --- Day 1: Report Repair ---
After saving Christmas five years in a row, you've decided to take a vacation at a nice resort on a tropical island. Surely, Christmas will go on without you.

The tropical island has its own currency and is entirely cash-only. The gold coins used there have a little picture of a starfish; the locals just call them stars. None of the currency exchanges seem to have heard of them, but somehow, you'll need to find fifty of these coins by the time you arrive so you can pay the deposit on your room.

To save your vacation, you need to get all fifty stars by December 25th.

Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!

Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input); apparently, something isn't quite adding up.

Specifically, they need you to find the two entries that sum to 2020 and then multiply those two numbers together.

For example, suppose your expense report contained the following:

1721
979
366
299
675
1456
In this list, the two entries that sum to 2020 are 1721 and 299. Multiplying them together produces 1721 * 299 = 514579, so the correct answer is 514579.

Of course, your expense report is much larger. Find the two entries that sum to 2020; what do you get if you multiply them together?

To begin, get your puzzle input.

1686
1983
1801
1890
1910
1722
1571
1952
1602
1551
1144
1208
1335
1914
1656
1515
1600
1520
1683
1679
1800
1889
1717
1592
1617
1756
1646
1596
1874
1595
1660
1748
1946
1734
1852
2006
1685
1668
1607
1677
403
1312
1828
1627
1925
1657
1536
1522
1557
1636
1586
1654
1541
1363
1844
1951
1765
1872
696
1764
1718
1540
1493
1947
1786
1548
1981
1861
1589
1707
1915
1755
1906
1911
1628
1980
1986
1780
1645
741
1727
524
1690
1732
1956
1523
1534
1498
1510
372
1777
1585
1614
1712
1650
702
1773
1713
1797
1691
1758
1973
1560
1615
1933
1281
1899
1845
1752
1542
1694
1950
1879
1684
1809
1988
1978
1843
1730
1377
1507
1506
1566
935
1851
1995
1796
1900
896
171
1728
1635
1810
2003
1580
1789
1709
2007
1639
1726
1537
1976
1538
1544
1626
1876
1840
1953
1710
1661
1563
1836
1358
1550
1112
1832
1555
1394
1912
1884
1524
1689
1775
1724
1366
1966
1549
1931
1975
1500
1667
1674
1771
1631
1662
1902
1970
1864
2004
2010
504
1714
1917
1907
1704
1501
1812
1349
1577
1638
1886
1157
1761
1676
1731
2001
1261
1154
1769
1529

Answer:


You can also [Share] this puzzle.

----------------------------------------------
## Rewrite the question in your own words:
From the list of numbers given, find a pair of numbers that add up to 2020. The answer to this problem will be product of those numbers.


## What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
* We can take the input in whatever datatype we want
* There is only one right answer
* Numbers are all positive
* No 0's
* It has to be 2 different numbers, it can't be the same number like 1010
* The list is unique
* There has to be an answer


## What are your initial thoughts about this problem? (high level design, 2-3 sentences)
We could iterate over the array and for each element, do a find to see if it's compliment for a sum of 2020 exists within the data set, if not, then delete that value from the list.


## How would you identify the elements of this problem?
- [X] Searching of Data
- [ ] Sorting of Data
- [ ] Pattern Recognition
- [ ] Build/Navigate a Grid
- [X] Math
- [ ] Language API knowledge
- [ ] Optimization


## Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
I think an array would be the best for this problem


## Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
We are going to use a .find to iterate through the array
We are going to look at the value at the -1 position and assign that to value_1
value_2 = 2020 - value_1
We will iterate through the array to find value_2
We will have to wrap all of that in a loop that will break when we find the right answer
If the value does not exist, then we will delete that value at position -1.
If value 2 exists and the .find stops, then the iteration breaks and we get our answer.


## What is the Big O complexity of your solution?
A little less than On^2 Since we are looping through each each value at -1 position, then iterating through the list to find its compliment.

## How do we make this more efficient?
We could probably get it down to O(n) if we figured out a way to remember the values and store them.

We can do that through hash mapping that way we iterate through the problem only once, but, we're indexing the values in a hash so that we can quickly look them up.

## Pseudo code


-------------------------------------------------
# --- Part Two ---
The Elves in accounting are thankful for your help; one of them even offers you a starfish coin they had left over from a past vacation. They offer you a second one if you can find three numbers in your expense report that meet the same criteria.

Using the above example again, the three entries that sum to 2020 are 979, 366, and 675. Multiplying them together produces the answer, 241861950.

In your expense report, what is the product of the three entries that sum to 2020?


----------------------------------------------
## Rewrite the question in your own words:
From the same list of numbers given, find 3 values that add up to 2020, then the answer is the product of those three numbers


## What assumptions will you make about this problem if you cannot ask any more clarifying questions? What are your reasons for making those assumptions?
* We can take the input in whatever datatype we want
* There is only one right answer
* Numbers are all positive
* No 0's
* It has to be 3 different numbers, it can't be the same number
* The list is unique
* There has to be an answer


## What are your initial thoughts about this problem? (high level design, 2-3 sentences)
We are going to have to sort the list of inputs first. Probably have to start at the first value, then move in from each side to see if there are two values in the mix that add up to 2020 - first value.

## Thoughts on how to solve
So, for example we will start at index 0.
The value at index 0 is 299.
We will then examine the value at index 1 which is 366 and the last value which is 1721.
When we add up all three of these values we get 2386 which is bigger than our desired 2020, so we have to check for a smaller number. This means we need to increment down from the last value. If the sum of the three was less than 2020, then we know we have to increment from the front side up one.

We should keep going through all the numbers in the array until we reach the middle and we don't find a set of numbers. Then we can move onto the next number in the iteration.


## How would you identify the elements of this problem?
- [X] Searching of Data
- [ ] Sorting of Data
- [ ] Pattern Recognition
- [ ] Build/Navigate a Grid
- [X] Math
- [ ] Language API knowledge
- [ ] Optimization


## Which data structure(s) do you think you'll use? What pros/cons do you see with that choice?
I think an array would be the best for this problem


## Write out a few lines of initial pseudocode: (mid-level design, NOT REAL CODE)
* First we will have to sort the list of numbers
* Then we are going to iterate over each index of the array using a .each
* We can do this by iterating over the size of the array, but we will have to start at 0 and end at the size of the array - 3, because there are 3 values we will be looking for.
* So, value_1 is going to be the value at index 0 of the array
* The second value we will be looking at is at the next index, which would be the index + 1
* The third value we will be looking at is the last value of the array, which is the array.size - 1
* If we add all 3 values up and it is greater than 2020, then we will need to lower the sum by looking at the next highest value or the second to last value in the array by subtracting another 1 from index 3
* If the sum of the 3 values is less than 2020, then we can increment up by looking at the next value from the front by 1 by looking at the index 2 + 1
* If the sum of the three values is 2020, then we return their product
* If there is no answer, we return that there isn't an answer


## What is the Big O complexity of your solution?
O(n^2)
