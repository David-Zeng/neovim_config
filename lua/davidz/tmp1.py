# Importing the numpy library for numerical operations on arrays
import numpy as np


def create_and_operate_arrays():
    """
    This function creates two 1D NumPy arrays, performs element-wise addition and multiplication,
    then outputs the results in a formatted manner.
    """

    # Creating two example arrays of integers using numpy's arange() function
    array_a = np.arange(5)
    array_b = np_array[
        4:9
    ]  # Assuming 'np_array' is previously defined with values [4, 5, 6, 7, 8]

    # Performing element-wise addition and multiplication
    summed_arrays = array_a + array_b
    product_arrays = array_a * array_b

    # Formatted output of the results using numpy's print_r() function for readability
    print("Summed Array:")
    np.set_printoptions(precision=2)  # Setting precision for displaying float numbers
    print(np.array(nummed_arrays))

    print("\nProduct of Arrays:")
    np.set_printoptions(
        precision=2, suppress=True
    )  # Suppressing scientific notation and setting precision
    print(np.array(product_arrays))


# Example usage
if __name__ == "__main__":
    create_and_operate_arrays()
