class AvengersHeadQuarter
    attr_accessor :list

    def initialize
        self.list = []
    end

    def put(avenger)
        self.list.push(avenger)
    end
end

#TDD (Desenvolvimento guiado por testes)
describe AvengersHeadQuarter do
    
    it 'deve adicionar um vingador' do
        hq = AvengersHeadQuarter.new

        hq.put('Spiderman')
        expect(hq.list).to eql ['Spiderman']    
    end

    it 'deve adicionar uma lista de vingadores' do
        hq = AvengersHeadQuarter.new

        # Comment Code Block Ctrl+K+C/Ctrl+K+U
        hq.put('Thor')
        hq.put('Hulk')
        hq.put('Spiderman')

        res = hq.list.size > 0

        expect(hq.list).to include 'Hulk'
        expect(hq.list.size).to be > 0
        expect(res).to be true
    end

    it 'Ironman deve ser o último da lista de vingadores' do
        hq = AvengersHeadQuarter.new

        # Comment Code Block Ctrl+K+C/Ctrl+K+U
        hq.put('Thor')
        hq.put('Hulk')
        hq.put('Spiderman')
        hq.put('Ironman')

        expect(hq.list).to end_with('Ironman')
       
    end

    it 'Deve conter o sobrenome' do
        
        avenger = 'Peter Parker'

        expect(avenger).to match(/Parker/)
        expect(avenger).not_to match(/Renner/)
       
    end

end
