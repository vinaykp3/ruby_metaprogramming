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
p.send(:get_name) # return "Person Get Name"
p.send(:get_age) # return "Person Get Age"
p.get_address # return "Person address"
p.get_detail # return "You called method get_detail, which is not defined"



class User

  def initialize(name, age)
    @name = name
    @age = age
    self.class.send(:define_singleton_method,"#{name}") { p "#{name} age is #{age}" }  
  end

end


User.new("vinay", 16)
User.vinay # return vinay age is 16
