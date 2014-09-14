# GoodPrint

Not as awesome as awesome_print.

```ruby
>> require 'good_print'
=> true

>> thing = { one: 1, two: 2, three: { array: [3.1, 3.2], hash: { one: 3.1, two: 3.2 }, string: "hello" }, four: [4.1, 4.2, 4.3] }
=> {:one=>1, :two=>2, :three=>{:array=>[3.1, 3.2], :hash=>{:one=>3.1, :two=>3.2}, :string=>"hello"}, :four=>[4.1, 4.2, 4.3]}

>> gp thing
{
  :one => 1,
  :two => 2,
  :three => {
    :array => [
      3.1,
      3.2
    ],
    :hash => {
      :one => 3.1,
      :two => 3.2
    },
    :string => "hello"
  },
  :four => [
    4.1,
    4.2,
    4.3
  ]
}
```
