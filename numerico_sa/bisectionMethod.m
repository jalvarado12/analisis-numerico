function p = bisectionMethod(f, a, b, tol, N0)
   i = 1;
   FA = f(a);


   while i <= N0

       p = a+ (b-a)/2;
       %fprintf(p);
       FP = f(p);
       if FP == 0 || (b-a)/2 < tol
           fprintf('Numero de iteraciones: %d', i);
           return
       end
       i = i+1;
       if FA * FP > 0
           a = p;
           FA = FP;
       else
           b = p;
       end
   end    
   fprintf('Method failed after %d iterations', N0);
end    
