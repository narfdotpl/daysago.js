today = new Date(2012, 5, 4)


describe 'daysAgo', ->

    it 'returns "X days ago"', ->
        for [iso, rel] in [
            ['2012-04-30', '35 days ago'],
            ['2012-05-31', '4 days ago'],
            ['2012-06-01', '3 days ago'],
            ['2012-06-02', '2 days ago']
        ]
            expect(daysAgo(iso, today)).toEqual(rel)

    it 'returns "yesterday"', ->
        expect(daysAgo('2012-06-03', today)).toEqual('yesterday')

    it 'returns "today"', ->
        expect(daysAgo('2012-06-04', today)).toEqual('today')

    it 'returns null for future dates', ->
        expect(daysAgo('2012-06-05', today)).toBeNull()


describe 'daysAgo.activateForClass', ->

    it 'changes DOM', ->
        doc = window.document

        # append hidden div to <body>
        div = doc.createElement('div')
        div.style.display = 'none'
        div.innerHTML = """
            <span class="js-date" title="2012-06-02">whatever</span>
            <span class="js-date" title="2012-06-03">whatever</span>
            <span class="js-date" title="2012-06-04">whatever</span>
            <span class="js-date" title="2012-06-05">whatever</span>
        """
        doc.getElementsByTagName('body')[0].appendChild(div)

        # activate module
        cls = 'js-date'
        daysAgo.activateForClass(cls, today)

        # check results
        els = doc.getElementsByClassName(cls)
        results = ['2 days ago', 'yesterday', 'today', '2012-06-05']
        for i in [0...els.length]
            el = els[i]
            text = results[i]
            expect(el.innerText).toEqual(text)
