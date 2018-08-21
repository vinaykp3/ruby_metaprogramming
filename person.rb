class Person
    def self.add_method(name)
        define_method(name) do
            value = name.split('_').map(&:capitalize).join(' ')
            p "Person #{value}"
        end
    end
    add_method('get_name')
    add_method('get_age')

    define_method('get_address') do
        p "Person address"
    end
    
    def method_missing(name)
        p "You called method #{name}, which is not defined"
    end
end

p = Person.new
p.send(:get_name)
p.send(:get_age)
p.get_address
p.get_detail