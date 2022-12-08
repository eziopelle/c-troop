import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-ticket"
export default class extends Controller {

  static targets = ["bar","fullbar", "text"]
  connect() {

  }

  submit() {
    this.fullbarTarget.classList.remove("d-none")

    let perc = 1
    let newWidth = ('width', perc + '%')

    const int = setInterval(()  => {
    perc += 0.2;
    newWidth = ('width', perc + '%');
    this.barTarget.style.width = newWidth;
    this.textTarget.innerText = Number((perc).toFixed(0)) + "%"
      clear();
      }, 10)

    const clear = () => {
      if (perc >= 100) {
        clearInterval(int);
      }
    }

    int();

  }
}




// function() {
//   var $bar, perc, start, update;



//   update = function() {
//     $bar.css("width", perc + '%');
//     $bar.attr("perc", Math.floor(perc) + '%');
//     perc += 0.2;
//     if (Math.floor(perc) === 5) {
//       $bar.addClass('active');
//     }
//     if (Math.floor(perc) === 95) {
//       $bar.removeClass('active');
//     }
//     if (perc >= 100) {
//       return perc = 0;
//     }
//   };

//   start = function() {
//     var run;
//     return run = setInterval(update, 10);
//   };

//   start();

// }).call(this);

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiPGFub255bW91cz4iXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7QUFBQSxNQUFBLElBQUEsRUFBQSxJQUFBLEVBQUEsS0FBQSxFQUFBOztFQUFBLElBQUEsR0FBTyxDQUFBLENBQUUsYUFBRjs7RUFDUCxJQUFBLEdBQU87O0VBRVAsTUFBQSxHQUFTLFFBQUEsQ0FBQSxDQUFBO0lBQ1AsSUFBSSxDQUFDLEdBQUwsQ0FBUyxPQUFULEVBQWtCLElBQUEsR0FBSyxHQUF2QjtJQUNBLElBQUksQ0FBQyxJQUFMLENBQVUsTUFBVixFQUFrQixJQUFJLENBQUMsS0FBTCxDQUFXLElBQVgsQ0FBQSxHQUFpQixHQUFuQztJQUNBLElBQUEsSUFBTztJQUVQLElBQUcsSUFBSSxDQUFDLEtBQUwsQ0FBVyxJQUFYLENBQUEsS0FBb0IsQ0FBdkI7TUFDRSxJQUFJLENBQUMsUUFBTCxDQUFjLFFBQWQsRUFERjs7SUFFQSxJQUFHLElBQUksQ0FBQyxLQUFMLENBQVcsSUFBWCxDQUFBLEtBQW9CLEVBQXZCO01BQ0UsSUFBSSxDQUFDLFdBQUwsQ0FBaUIsUUFBakIsRUFERjs7SUFFQSxJQUFHLElBQUEsSUFBUSxHQUFYO2FBQ0UsSUFBQSxHQUFPLEVBRFQ7O0VBVE87O0VBWVQsS0FBQSxHQUFRLFFBQUEsQ0FBQSxDQUFBO0FBQ1IsUUFBQTtXQUFFLEdBQUEsR0FBTSxXQUFBLENBQWEsTUFBYixFQUFvQixFQUFwQjtFQURBOztFQUdSLEtBQUEsQ0FBQTtBQWxCQSIsInNvdXJjZXNDb250ZW50IjpbIiRiYXIgPSAkKCcucGVyY2VudGFnZScpXG5wZXJjID0gMFxuXG51cGRhdGUgPSAoKSAtPlxuICAkYmFyLmNzcyhcIndpZHRoXCIsIHBlcmMrJyUnKVxuICAkYmFyLmF0dHIoXCJwZXJjXCIsIE1hdGguZmxvb3IocGVyYykrJyUnKVxuICBwZXJjICs9MC4yXG4gIFxuICBpZiBNYXRoLmZsb29yKHBlcmMpID09IDVcbiAgICAkYmFyLmFkZENsYXNzICdhY3RpdmUnICAgIFxuICBpZiBNYXRoLmZsb29yKHBlcmMpID09IDk1XG4gICAgJGJhci5yZW1vdmVDbGFzcyAnYWN0aXZlJyAgICBcbiAgaWYgcGVyYyA+PSAxMDBcbiAgICBwZXJjID0gMFxuXG5zdGFydCA9ICgpIC0+XG4gIHJ1biA9IHNldEludGVydmFsKCB1cGRhdGUsMTApXG4gIFxuc3RhcnQoKSJdfQ==
//# sourceURL=coffeescript
