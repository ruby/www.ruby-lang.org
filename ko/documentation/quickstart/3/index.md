---
layout: page
title: "루비 20분 가이드"
lang: ko
---

“Greeter” 객체를 만들어서 사용해 봅시다.

    irb(main):035:0> g = Greeter.new("Pat")
    => #<0x16cac>
    irb(main):036:0> g.say_hi
    Hi Pat!
    => nil
    irb(main):037:0> g.say_bye
    Bye Pat, come back soon.
    => nil</0x16cac>

“g” 객체가 만들어진 이후에는 “Pat”이란 이름을 기억합니다. 직접 이름을 접근할 수 있냐구요?

    irb(main):038:0> g.@name
    SyntaxError: compile error
    (irb):52: syntax error
            from (irb):52

보다시피 가능하지 않습니다.

## 객체 들여다보기

객체 변수는 객체 안에 숨겨져 있습니다. 사실 객체 변수가 그렇게 꽁꽁 숨겨져 있는 것은 아니지만, 루비는 기본적으로 데이타를
숨겨두는 객체지향 방식을 따르고 있습니다. “Greeter” 객체에는 어떤 메서드가 들어있을까요?

    irb(main):039:0> Greeter.instance_methods
    => ["method", "send", "object_id", "singleton_methods",
      "__send__", "equal?", "taint", "frozen?",
        "instance_variable_get", "kind_of?", "to_a",
        "instance_eval", "type", "protected_methods", "extend",
        "eql?", "display", "instance_variable_set", "hash",
        "is_a?", "to_s", "class", "tainted?", "private_methods",
        "untaint", "say_hi", "id", "inspect", "==", "===",
        "clone", "public_methods", "respond_to?", "freeze",
        "say_bye", "__id__", "=~", "methods", "nil?", "dup",
        "instance_variables", "instance_of?"]

메서드가 상당히 많은 것을 알 수 있습니다. 우리가 정의한 메서드는 2개에 불과한데 어떻게 된 것일까요? 위의 리스트는
“Greeter” 클래스 자체의 메서드 뿐만 아니라 모든 부모 클래스의 메서드도 포함하고 있기 때문입니다. “false”를 인자로
넘기면 부모 클래스에 정의된 메서드를 제외한 리스트를 볼 수 있습니다.

    irb(main):040:0> Greeter.instance_methods(false)
    => ["say_bye", "say_hi"]

우리의 “Greeter” 객체가 어떤 메서드에 응답하는지를 개별적으로 확인하는 것도 가능합니다.

    irb(main):041:0> g.respond_to?("name")
    => false
    irb(main):042:0> g.respond_to?("say_hi")
    => true
    irb(main):043:0> g.respond_to?("to_s")
    => true

즉 “g” 객체는 “say\_hi”라는 이름의 메서드를 가지고 있고 “to\_s”라는 이름의 메서드도 가지고 있지만,
“name”이란 이름의 메서드에 응답하지는 않습니다.

## 클래스 정의 변경하기

만약 객체 변수 ”@name”의 내용을 확인하고 또 변경하고 싶다면 어떻게 해야 할까요? 루비는 객체 변수를 접근하게 해주는
편리한 방법을 제공하고 있습니다.

    irb(main):044:0> class Greeter
    irb(main):045:1>   attr_accessor :name
    irb(main):046:1> end
    => nil

루비에서는 클래스를 언제나 열어서 정의를 변경할 수 있습니다. 새로운 객체를 만들어서 ”@name”에 접근해봅시다.

    irb(main):047:0> g = Greeter.new("Andy")
    => #<0x3c9b0>
    irb(main):048:0> g.respond_to?("name")
    => true
    irb(main):049:0> g.respond_to?("name=")
    => true
    irb(main):050:0> g.say_hi
    Hi Andy!
    => nil
    irb(main):051:0> g.name="Betty"
    => "Betty"
    irb(main):052:0> g
    => #<0x3c9b0>
    irb(main):053:0> g.name
    => "Betty"
    irb(main):054:0> g.say_hi
    Hi Betty!
    => nil</0x3c9b0></0x3c9b0>

“attr\_accessor”은 두개의 메서드를 새로 정의하는데, “name”은 객체변수의 값에 접근하기 위해서이고
“name=”은 객체변수의 값을 변경하기 위해서입니다.

## Mega Greeter

이번에는 여러 명의 사람에게 인사를 할 수 있는 “Mega Greeter”를 한번 만들어 보도록 합시다.

이번에는 IRB 루비 인터랙티브 해석기를 사용하는 대신에 별도의 파일에 코드를 작성해봅시다.

IRB에서 빠져나오기 위해서는 “quit” 또는 “exit”이라고 입력하거나 Control-D를 누르면 됩니다.

    #!/usr/bin/env ruby
    
    class MegaGreeter
      attr_accessor :names
    
      # Create the object
      def initialize(names = "World")
        @names = names
      end
    
      # Say hi to everybody
      def say_hi
        if @names.nil?
          puts "..."
        elsif @names.respond_to?("each")
    
          # @names is a list of some kind, iterate!
          @names.each do |name|
            puts "Hello #{name}!"
          end
        else
        puts "Hello #{@names}!"
        end
      end
    
      # Say bye to everybody
      def say_bye
        if @names.nil?
          puts "..."
        elsif @names.respond_to?("join")
          # Join the list elements with commas
          puts "Goodbye #{@names.join(", ")}.  Come back soon!"
        else
          puts "Goodbye #{@names}.  Come back soon!"
        end
      end
    
    end
    
    if __FILE__ == $0
      mg = MegaGreeter.new
      mg.say_hi
      mg.say_bye
    
      # Change name to be "Zeke"
      mg.names = "Zeke"
      mg.say_hi
      mg.say_bye
    
      # Change the name to an array of names
      mg.names = ["Albert", "Brenda", "Charles",
        "Dave", "Englebert"]
      mg.say_hi
      mg.say_bye
    
      # Change to nil
      mg.names = nil
      mg.say_hi
      mg.say_bye
    end

위의 파일을 “ri20min.rb”로 저장을 하고, “ruby ri20min.rb”라고 입력해서 실행을 시킵니다. 결과는 다음과
같아야 합니다.

    Hello World!
    Goodbye World.  Come back soon!
    Hello Zeke!
    Goodbye Zeke.  Come back soon!
    Hello Albert!
    Hello Brenda!
    Hello Charles!
    Hello Dave!
    Hello Englebert!
    Goodbye Albert, Brenda, Charles, Dave, Englebert.  Come
    back soon!
    ...
    ...

이번 예제에는 새로운 내용들이 여럿 있으므로 [다음에서](/ko/documentation/quickstart/4/) 하나씩 자세히
살펴보도록 합시다.

