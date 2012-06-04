daysago.js
==========

Primitive JavaScript "module" that makes dates relative ("YYYY-MM-DD" →
"X days ago").


Features
--------

- "X days ago", "yesterday" and "today" as the only valid output
- support only for dates in the "YYYY-MM-DD" format
- no support for time zones
- no support for future dates
- `daysAgo(string)` for individual dates
- `daysAgo.activateForClass(string)` for DOM elements


Examples
--------

### Plain JS

    > daysAgo('2012-06-02')
    '2 days ago'
    > daysAgo('2012-06-03')
    'yesterday'
    > daysAgo('2012-06-04')
    'today'
    > daysAgo('2012-06-05')
    null


### DOM

HTML

    <span class="js-date" title="2012-06-02">whatever</span>
    <span class="js-date" title="2012-06-03">whatever</span>
    <span class="js-date" title="2012-06-04">whatever</span>
    <span class="js-date" title="2012-06-05">whatever</span>

JS

    daysAgo.activateForClass('js-date')

result

    <span class="js-date" title="2012-06-02">2 days ago</span>
    <span class="js-date" title="2012-06-03">yesterday</span>
    <span class="js-date" title="2012-06-04">today</span>
    <span class="js-date" title="2012-06-05">2012-06-05</span>


Meta
----

daysago.js is written by [Maciej Konieczny][].  This software is
released into the [public domain][].

  [Maciej Konieczny]: http://narf.pl/
  [public domain]: http://unlicense.org/
