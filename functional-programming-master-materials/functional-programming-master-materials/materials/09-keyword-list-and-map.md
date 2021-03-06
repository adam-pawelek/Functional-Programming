# **Functional Programming**
Jani Immonen, D571
jani.immonen@jamk.fi


&nbsp;
## **Keyword lists and maps**
So far we haven't discussed any associative data structures, i.e. data structures that are able to associate a certain value (or multiple values) to a key. Different languages call these different names like dictionaries, hashes, associative arrays, etc.

In Elixir, we have two main associative data structures: keyword lists and maps. It's time to learn more about them.

&nbsp;
### **Keyword lists**
In many functional programming languages, it is common to use a list of 2-item tuples as the representation of a key-value data structure. In Elixir, when we have a list of tuples and the first item of the tuple (i.e. the key) is an atom, we call it a keyword list:

    iex> list = [{:a, 1}, {:b, 2}]
    [a: 1, b: 2]
    iex> list == [a: 1, b: 2]
    true

As you can see above, Elixir supports a special syntax for defining such lists: [key: value]. Underneath it maps to the same list of tuples as above. Since keyword lists are lists, we can use all operations available to lists. For example, we can use ++ to add new values to a keyword list:

    iex> list ++ [c: 3]
    [a: 1, b: 2, c: 3]
    iex> [a: 0] ++ list
    [a: 0, a: 1, b: 2]

Note that values added to the front are the ones fetched on lookup:

    iex> new_list = [a: 0] ++ list
    [a: 0, a: 1, b: 2]
    iex> new_list[:a]
    0

Keyword lists are important because they have three special characteristics:

* Keys must be atoms.
* Keys are ordered, as specified by the developer.
* Keys can be given more than once.

For example, the [Ecto library](https://github.com/elixir-lang/ecto) makes use of these features to provide an elegant DSL for writing database queries:

    query = from w in Weather,
        where: w.prcp > 0,
        where: w.temp < 20,
        select: w

These characteristics are what prompted keyword lists to be the default mechanism for passing options to functions in Elixir. In previous lesson we discussed the if/2 macro, we mentioned that the following syntax is supported:

    iex> if false, do: :this, else: :that
    :that

The do: and else: pairs form a keyword list. In fact, the call above is equivalent to:

    iex> if(false, [do: :this, else: :that])
    :that

Which, as we have seen above, is the same as:

    iex> if(false, [{:do, :this}, {:else, :that}])
    :that

In general, when the keyword list is the last argument of a function, the square brackets are optional.

Although we can pattern match on keyword lists, it is rarely done in practice since pattern matching on lists requires the number of items and their order to match:

    iex> [a: a] = [a: 1]
    [a: 1]
    iex> a
    1
    iex> [a: a] = [a: 1, b: 2]
    ** (MatchError) no match of right hand side value: [a: 1, b: 2]
    iex> [b: b, a: a] = [a: 1, b: 2]
    ** (MatchError) no match of right hand side value: [a: 1, b: 2]

In order to manipulate keyword lists, Elixir provides the Keyword module. Remember, though, keyword lists are simply lists, and as such they provide the same linear performance characteristics as lists. The longer the list, the longer it will take to find a key, to count the number of items, and so on. For this reason, keyword lists are used in Elixir mainly for passing optional values. If you need to store many items or guarantee one-key associates with at maximum one-value, you should use maps instead.

&nbsp;
### **Maps**
Whenever you need a key-value store, maps are the *go to* data structure in Elixir. A map is created using the **%{}** syntax:

    iex> map = %{:a => 1, 2 => :b}
    %{2 => :b, :a => 1}
    iex> map[:a]
    1
    iex> map[2]
    :b
    iex> map[:c]
    nil

Compared to keyword lists, we can already see two differences:

* Maps allow any value as a key.
* Maps' keys do not follow any ordering.

In contrast to keyword lists, maps are very useful with pattern matching. When a map is used in a pattern, it will always match on a subset of the given value:

    iex> %{} = %{:a => 1, 2 => :b}
    %{2 => :b, :a => 1}
    iex> %{:a => a} = %{:a => 1, 2 => :b}
    %{2 => :b, :a => 1}
    iex> a
    1
    iex> %{:c => c} = %{:a => 1, 2 => :b}
    ** (MatchError) no match of right hand side value: %{2 => :b, :a => 1}

As shown above, a map matches as long as the keys in the pattern exist in the given map. Therefore, an empty map matches all maps.

Variables can be used when accessing, matching and adding map keys:

    iex> n = 1
    1
    iex> map = %{n => :one}
    %{1 => :one}
    iex> map[n]
    :one
    iex> %{^n => :one} = %{1 => :one, 2 => :two, 3 => :three}
    %{1 => :one, 2 => :two, 3 => :three}

The Map module provides a very similar API to the Keyword module with convenience functions to manipulate maps:

    iex> Map.get(%{:a => 1, 2 => :b}, :a)
    1
    iex> Map.put(%{:a => 1, 2 => :b}, :c, 3)
    %{2 => :b, :a => 1, :c => 3}
    iex> Map.to_list(%{:a => 1, 2 => :b})
    [{2, :b}, {:a, 1}]

Maps have the following syntax for updating a key's value:

    iex> map = %{:a => 1, 2 => :b}
    %{2 => :b, :a => 1}

    iex> %{map | 2 => "two"}
    %{2 => "two", :a => 1}
    iex> %{map | :c => 3}
    ** (KeyError) key :c not found in: %{2 => :b, :a => 1}

The syntax above requires the given key to exist. It cannot be used to add new keys. For example, using it with the :c key failed because there is no :c in the map.

When all the keys in a map are atoms, you can use the keyword syntax for convenience:

    iex> map = %{a: 1, b: 2}
    %{a: 1, b: 2}
    
Another interesting property of maps is that they provide their own syntax for accessing atom keys:

    iex> map = %{:a => 1, 2 => :b}
    %{2 => :b, :a => 1}

    iex> map.a
    1
    iex> map.c
    ** (KeyError) key :c not found in: %{2 => :b, :a => 1}

Elixir developers typically prefer to use the map.field syntax and pattern matching instead of the functions in the Map module when working with maps because they lead to an assertive style of programming. [This blog post by Jos?? Valim](https://dashbit.co/blog/writing-assertive-code-with-elixir) provides insight and examples on how you get more concise and faster software by writing assertive code in Elixir.

&nbsp;
### **Nested data structures**
Often we will have maps inside maps, or even keywords lists inside maps, and so forth. Elixir provides conveniences for manipulating nested data structures via the **put_in/2**, **update_in/2** and other macros giving the same conveniences you would find in imperative languages while keeping the immutable properties of the language.

Imagine you have the following structure:

    iex> users = [
    john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
    mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Python"]}
    ]
    [john: %{age: 27, languages: ["Erlang", "Ruby", "Elixir"], name: "John"},
    mary: %{age: 29, languages: ["Elixir", "F#", "Python"], name: "Mary"}]

We have a keyword list of users where each value is a map containing the name, age and a list of programming languages each user likes. If we wanted to access the age for john, we could write:

    iex> users[:john].age
    27

It happens we can also use this same syntax for updating the value:

    iex> users = put_in users[:john].age, 31
    [john: %{age: 31, languages: ["Erlang", "Ruby", "Elixir"], name: "John"},
    mary: %{age: 29, languages: ["Elixir", "F#", "Python"], name: "Mary"}]

The **update_in/2** macro is similar but allows us to pass a function that controls how the value changes. For example, let's remove *Python* from Mary's list of languages:

    iex> users = update_in users[:mary].languages, fn languages -> List.delete(languages, "Python") end
    [john: %{age: 31, languages: ["Erlang", "Ruby", "Elixir"], name: "John"},
    mary: %{age: 29, languages: ["Elixir", "F#"], name: "Mary"}]

There is more to learn about **put_in/2** and **update_in/2**, including the **get_and_update_in/2** that allows us to extract a value and update the data structure at once. There are also **put_in/3**, **update_in/3** and **get_and_update_in/3** which allow dynamic access into the data structure. Check their respective documentation in the Kernel module for more information.

This concludes our introduction to associative data structures in Elixir. You will find out that, given keyword lists and maps, you will always have the right tool to tackle problems that require associative data structures in Elixir.

&nbsp;
----
**?? Elixir-Lang.org, Jani Immonen**

