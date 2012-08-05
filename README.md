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
- `daysAgo(stringDate)` for individual dates
- `daysAgo.activateForClass(className)` for DOM elements


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

    <time class="js-date" datetime="2012-06-02" title="2012-06-02">whenever</time>
    <time class="js-date" datetime="2012-06-03" title="2012-06-03">whenever</time>
    <time class="js-date" datetime="2012-06-04" title="2012-06-04">whenever</time>
    <time class="js-date" datetime="2012-06-05" title="2012-06-05">whenever</time>

JS

    daysAgo.activateForClass('js-date')

result

    <time class="js-date" datetime="2012-06-02" title="2012-06-02">2 days ago</time>
    <time class="js-date" datetime="2012-06-03" title="2012-06-03">yesterday</time>
    <time class="js-date" datetime="2012-06-04" title="2012-06-04">today</time>
    <time class="js-date" datetime="2012-06-05" title="2012-06-05">whenever</time>


Meta
----

daysago.js is written by [Maciej Konieczny][].  This software is
released into public domain.

  [Maciej Konieczny]: http://narf.pl/
