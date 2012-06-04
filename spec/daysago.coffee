describe 'daysAgo', ->

    beforeEach ->
        @today = new Date(2012, 5, 4)

    it 'returns "X days ago"', ->
        for [iso, rel] in [
            ['2012-04-30', '35 days ago'],
            ['2012-05-31', '4 days ago'],
            ['2012-06-01', '3 days ago'],
            ['2012-06-02', '2 days ago']
        ]
            expect(daysAgo(iso, @today)).toEqual(rel)

    it 'returns "yesterday"', ->
        expect(daysAgo('2012-06-03', @today)).toEqual('yesterday')

    it 'returns "today"', ->
        expect(daysAgo('2012-06-04', @today)).toEqual('today')

    it 'returns null for future dates', ->
        expect(daysAgo('2012-06-05', @today)).toBeNull()
