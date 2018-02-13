data = load('dataset1.dat');
data = data';
input = data(1, :);
output = data(2, :);
sampleRatio = 0.7;
[inputn, inputs] = mapminmax(input);
[outputn, outputs] = mapminmax(output);

bpnn = newff(inputn, outputn, 3);

bpnn.trainParam.epochs = 1000;
bpnn.trainParam.goal = 0.001;
bpnn.trainParam.lr = 0.05;
bpnn = train(bpnn, inputn(1:length(inputn) * sampleRatio), ...
    outputn(1:length(outputn) * sampleRatio));

est = bpnn(inputn);
est = mapminmax('reverse', est, outputs);
figure;
plot(input, output, 'ko', input, est, 'b-');