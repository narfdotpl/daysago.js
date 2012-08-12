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
            <time class="js-date" datetime="2012-06-02" title="2012-06-02">whenever</time>
            <time class="js-date" datetime="2012-06-03" title="2012-06-03">whenever</time>
            <time class="js-date" datetime="2012-06-04" title="2012-06-04">whenever</time>
            <time class="js-date" datetime="2012-06-05" title="2012-06-05">whenever</time>
        """
        doc.getElementsByTagName('body')[0].appendChild(div)

        # activate module
        cls = 'js-date'
        daysAgo.activateForClass(cls, today)

        # check results
        els = doc.getElementsByClassName(cls)
        results = ['2 days ago', 'yesterday', 'today', 'whenever']
        for i in [0...els.length]
            el = els[i]
            text = results[i]
            expect(el.innerHTML).toEqual(text)
