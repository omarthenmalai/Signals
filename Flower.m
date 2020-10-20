classdef Flower
    properties
        petalWidth
        petalLength
        sepalWidth
        sepalLength
        species
    end
    methods
        function obj = Flower(pw,pl,sw,sl, spec)
            obj.petalWidth = pw;
            obj.petalLength = pl;
            obj.sepalWidth = sw;
            obj.sepalLength = sl;
            obj.species = spec;
        end
        function s = getSLength(flower)
            s = flower.sepalLength;
        end
        function r = report(flower)
            disp(['The length and width of its sepal are ', num2str(flower.petalLength),'cm and ',num2str(flower.petalWidth),'cm respectively, while the length and width of its petals are ',num2str(flower.petalLength), 'cm and ',num2str(flower.petalWidth),'cm respectively. It belongs to the ', flower.species,' species.'])
        end
     
            
    end
end
    
            