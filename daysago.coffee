{floor} = Math


daysAgo = (stringDate, _today=new Date()) ->
    # change stringDate into a Date
    [y, m, d] = stringDate[0...10].split('-')
    date = new Date(+y, +m - 1, +d)

    # use current day as a base
    today = _today

    # clear "time" part of "datetime"
    today.setHours(0)
    today.setMinutes(0)
    today.setSeconds(0)
    today.setMilliseconds(0)

    # get difference in days
    milliseconds = today.getTime() - date.getTime()
    days = floor(milliseconds / 86400000)

    # excuse me, are you from the future?
    return null if days < 0

    # format result
    switch days
        when 0 then 'today'
        when 1 then 'yesterday'
        else "#{days} days ago"


daysAgo.activateForClass = (className, _today=new Date()) ->
    # use "datetime" attribute
    for el in window.document.getElementsByClassName(className)
        result = daysAgo(el.attributes.datetime.value, _today)
        if result
            el.innerText = result

# export
window.daysAgo = daysAgo
