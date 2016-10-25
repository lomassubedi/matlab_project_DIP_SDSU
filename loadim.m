function loadim(image_name, image_w, image_h)
    % clean
    close all;    
    
    % Creating a matrix with random values and known dimensions 
    image_raw = 255 * abs(randn(image_h, image_w));  

    % plot image name
    figure('Name',image_name);
    imagesc(image_raw);
        
    % Reshape matrix to vector for storing to a binary data file 
    array_vlues = reshape(image_raw, image_h * image_w, 1);
        
    % create file with write and append permission
    write_file_id = fopen(strcat(image_name, '.dat'),'a');

    % save uint8 data from the image.dat file 
    fwrite(write_file_id, array_vlues,'uint8');

    % Close the file (end of file operation)
    fclose(write_file_id);                                
end
