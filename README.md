# OptionMaxPain

Automatically calculate max pain of options listed on the National Stock Exchange of India, or through custom data

## What is Option Pain?

> The theory of options pain stems as a corollary to the belief – “90% of the options expire worthless, hence option writers/sellers tend to make money more often, more consistently than the option buyers”.<br><br>
Now if this statement is true, then we can make a bunch of logical deductions –<br>
>1) At any point only one party can make money i.e either the option buyers or option sellers, but not both.
>2) From the above statement, it is clear that the sellers are the ones making money.
>3) If option sellers tend to make maximum money, then it also means that the price of the option on expiry day should be driven to a point where it would cause least amount of loss to option writers.<br><br>

>If point 2 is true, then it further implies that option prices can be manipulated, at least on the day of expiry.<br>
If point 3 is true, then it further implies that there exists a group of traders who can manipulate the option prices, at least on the day of expiry.<br><br>
If such a group exists then it must be the option writers/sellers since it is believed that they are the ones who make maximum money/consistently make money trading options.<br><br>
Now considering all the above points, there must exist a single price point at which, if the market expires, then it would cause least amount of pain to the option writers (or cause maximum amount of pain to option buyers).<br><br>
If one can identify this price point, then it’s most likely that this is the point at which markets will expire. The ‘Option Pain’ theory does just this – identify the price at which the market is likely to expire considering least amount of pain is caused to option writers.If one can identify this price point, then it’s most likely that this is the point at which markets will expire. The ‘Option Pain’ theory does just this – identify the price at which the market is likely to expire considering least amount of pain is caused to option writers.

[Read more about Option Max Pain](https://zerodha.com/varsity/chapter/max-pain-pcr-ratio/ "Read more about Option Max Pain")

---
## Requirements
+ Ruby ( v2.4+ Recommended)


## How to use?
#### Ready Made Script for National Stock Exchange, India
##### 1) Installing the Gem
```sh
$ gem install option_max_pain
```
##### 2) Download the script inside the examples folder called nse_calculator.rb and run using ruby
```text
$ ruby nse_calculator.rb
----- Calculate Option Max Pain - NSE, India -----
Enter Stock Symbol as on NSE's Website (Eg. NIFTY or HEROMOTOCO), press Ctrl+C to exit
nifty

The min loss to option writers is at the strike Rs 10900.
The loss to option writers if market expired right now at this strike is Rs 7882650000

```
---
#### Programmatically
##### 1) Installing the Gem
```sh
$ gem install option_max_pain
```
##### 2) Using it to Calculate Max Pain
- If you want to calculate option pain of equity options listed on the National Stock Exchange, just pass in the underlying stock symbol of the option like follow
	```ruby
    require 'option_max_pain'
    result = OptionMaxPain::NseCalculator.calculate_max_pain('NIFTY')
    
    # result[0] contains the strike price which is the option pain strike price
    # result[1] contains the loss that is cause to options writer if market expired right now at this strike price
- If you want to calculate option pain using your own data, you can just require base calculator class and pass the data in the following format yourself
	```ruby
    require 'option_max_pain'
    options = {
      7700 => {call: 1823400, put: 5783025},
      7800 => {call: 3448575, put: 4864125},
      7900 => {call: 5367450, put: 2559375}
    }
    # options should be a hash with available strikes as keys that contains a hash of its Open Interest of call and put options

    result = OptionMaxPain::Calculator.calculate_max_pain(options) 
    # result[0] contains the strike price which is the option pain strike price
    # result[1] contains the loss that is caused to options writer if market expired right now at this strike price
    ```
