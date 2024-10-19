pragma circom 2.0.0;

template LogicCircuit () {  
   // Inputs  
   signal input a;  
   signal input b;  
   
   // Output signal
   signal output Q;  
   
   // Intermediate signals
   signal intermediateX; 
   signal intermediateY;
   
   // Component gates
   component gateAnd = ANDGate();
   component gateNot = NOTGate();
   component gateOr = ORGate();
   
   // Circuit logic
   gateAnd.a <== a;
   gateAnd.b <== b;
   intermediateX <== gateAnd.out;
   gateNot.in <== b;
   intermediateY <== gateNot.out;
   gateOr.a <== intermediateX;
   gateOr.b <== intermediateY;
   Q <== gateOr.out;
}

template ANDGate() {
    signal input a;
    signal input b;
    signal output out;

    out <== a * b;
}

template NOTGate() {
    signal input in;
    signal output out;

    out <== 1 - in;
}

template ORGate() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a * b;
}

component main = LogicCircuit();

