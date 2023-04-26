%Exercise1: Calculate mean calcium signal for each neuron
%input: 2D array of calcum signals, column: neuron and row:time point

%write a function that calculates the mean calcium signal for each neuron 
%and returns an array of the mean values

function mean_values = calculates_mean (calciumSignals)
    %input = 2D arrays with each column representing neurons and row represents time point
    %output =  an array of mean calcium signal for each neuron
    
        %But first, we have to provide an empty array with 1 row (the mean value) and column in the size of calciumSignals
        mean_values = zeros (1, size(calciumSignals, 2));
        %in this code, we create matrix of zero.
        %1 indicates number of row 
        %calciumSignals, 2 : indicate (2) in the array data, which is column.
        for i = 1:size(calciumSignals, 2)
            mean_values (i) = mean(calciumSignals(:, i));
            disp (mean_values);
        end 
    end
    
    
    
    %Exercise2: Calculate total distance traveled by a mouse in 2D environemnt
    %Write a function that calculates the total distance traveled by the mouse and returns the total distance
    
    function [total_distance] = calculate_mouse_distance(xy)
        %input = xy (x and y coordinate of the mouse generated from function GenerateMouseCoordinates)
        total_distance = 0;
        %assigning prev_x and prev_y as first x and y coordinate in the data 
        %xy(1,1) refers to row 1 column 1 (x) and xy(1,2)to row 1 column 2(y);
        prev_x = xy(1,1);
        prev_y = xy(1,2);
            for i = 1:size(xy)
            %i will show the size of the xy, which is 100 and it will take the value of 1st and 2nd dimension of 100th row
            x = xy(i, 1);
            y = xy(i, 2);
            total_distance = total_distance + sqrt((x - prev_x)^2 + (y - prev_y)^2);
            end
            disp (['The total distance travelled is ' num2str(total_distance)])
    end
    
    %example use in the matlab: 
    calculate_mouse_distance (xy);
    The total distance travelled is 45.4781
    
    
    
    
    %Exercise3: Find the maximum dendritic length and corresponding neuron ID for a set of neurons
    
    function [max_length, max_neuronID] = find_length_ID (dendritic_length, neuron_ID)
        %input = 1D array of dendritic length;and 1D array of neuron ID
        %output = max_length and corresponding neuiron ID 
            max_length = NaN;
            max_neuronID = '';
            [max_length, idx] = max (dendritic_length);
            %max function above returns the max length and index, so you can call the neuronID based on the index
            max_neuronID = neuron_ID(idx);
            %display the result 
            disp(['The longest dendrite is ' max_neuronID, ' with the length of ' max_length]);
        
    end
    
    %Example use in matlab: 
    dendritic_length = [ 50, 60, 85, 79, 102, 16, 48 ];
    neuron_ID = {'A', 'B', 'C', 'D', 'E', 'F', 'G'};
    
    find_length_ID (dendritic_length, neuron_ID);
    {'The longest dend…'}    {'E'}    {' with the length…'}    {[102]}
    
    
    
    
    
    %Exercise4 : Calculate the difference in calcium signals at even and odd time points
    % input: 1D array data of calcium_signals, write functions to sum data at even and odd time points
    
    function total_even = calculating_even_and_odd (calcium_signal)
        %to iterate over the even elements. start from the 2nd row, and then move the 2 steps over the length of the data.
        total_even = 0;
        total_odd = 0;
        for i = 2:2:length (calcium_signal)
            total_even = total_even + calcium_signal(i);
        end 
        for i = i:2:length (calcium_signal)
            total_odd = total_odd + calcium_signal(i);
        disp (["total even data is", total_even]);
        disp (["total odd data is", total_odd]);
        end 
    end 
    
    %example: 
    calcium_signal = [13, 15, 17, 20, 24, 26, 40, 47, 39, 70];
    calculating_even_and_odd (calcium_signal);
        "total even data is"    "178"
    
        "total odd data is"    "70"
    
    
    
    
    
    %Exercise5 : Create scatter plot of calcium signal vs mouse speed over time. 
    function scatter_plot = create_plot (calcium_signal, mouse_speed)
       scatter_plot = scatter(calcium_signal, mouse_speed);
       xlabel('calcium_signal');
       ylabel('mosue_speed');
       title ('Calcium Signal vs Mouse Speed')
       axis equal; 
    end 