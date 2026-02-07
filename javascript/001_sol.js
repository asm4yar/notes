const numbers = [1, 2, 3, 4, 5]
Array.prototype.sum = function () {
    let initialValue = 0;
    return this.reduce(
        (accumulator, currentValue) => accumulator + currentValue, initialValue,
    );
}

console.log(numbers.sum()); // 15

