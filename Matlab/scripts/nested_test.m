function nested_test()
    x = 3;
    y = 5;
    z = [];
    f1;
    f2;
    
    function f1()
        z = x + y
    end
    
    function f2()
        u = z * 2
    end
end