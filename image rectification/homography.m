function H = homography(p1, p2)
	n = size(p1, 1);
	if n < 3
		error('Not enough points');
	end 
	A = zeros(n*3,9);
	b = zeros(n*3,1);
	for i=1:n
		A(3*(i-1)+1,1:3) = [p2(i,:),1];
		A(3*(i-1)+2,4:6) = [p2(i,:),1];
		A(3*(i-1)+3,7:9) = [p2(i,:),1];
		b(3*(i-1)+1:3*(i-1)+3) = [p1(i,:),1];
	end
	x = (A\b)';
	H = [x(1:3); x(4:6); x(7:9)]; 