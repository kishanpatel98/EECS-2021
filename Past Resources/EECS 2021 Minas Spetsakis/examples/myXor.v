module myXor(z, a, b);
output z;
input a, b;
wire alpha, beta;
wire na, nb;

not upperNot(nb, b);
not lowerNot(na, a);

and upperAnd(alpha, a, nb);
and lowerAnd(beta, na, b);

or last(z, alpha, beta);

endmodule

