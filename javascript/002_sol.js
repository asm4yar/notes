const numbers = [1, 2, 3, 4, 5]
Object.defineProperty(Array.prototype, "sum", {
    value: function () {
        return this.reduce((total, value) => {
            const num = typeof value === 'number' ? value : Number(value);
            return Number(isFinite(num) ? total + num : total)
        }, 0)
    },
    enumerable: false,
});


console.log(numbers.sum()); // 15

