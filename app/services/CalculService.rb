class CalculService
    private_class_method :new
    @@instanceCalcul = self.new
    def self.instance
        return @@instanceCalcul
    end

    def CalculateDecimalAverage(list_decimal)
        #Fait la somme des valeurs decimal 
        @sum = list_decimal.inject(0.0){|sum,el| sum + el}
        #Fait la moyenne en arrondissant à 1 chiffre après la virgule
        (@sum / list_decimal.size).round(1)
    end
end
