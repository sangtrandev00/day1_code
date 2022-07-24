

import B "mo:base/Buffer";
import Debug "mo:base/Debug";
import I "mo:base/Iter";
import O "mo:base/Option";
import Array "mo:base/Array";

actor {

  
  //Challenge 1
  public func add(m: Nat, n: Nat): async Nat {
        return m + n;
  };

  // Challenge 2
  public func getAreaSquare(n : Nat): async Nat {
      return n * n;
  };

  // Challenge 3
  public func convertDayToSecond(n : Nat): async Nat {
    return n * 24 * 60 * 60;
  };

  // Challenge 4
  var count : Nat = 0;
  public func increment_counter (n : Nat): async Nat {
      count := count + n;
      return count;
  };

  public func clear_counter () {
    count := 0;
  };

  // Challenge 5

  public func divide(m: Nat, n: Nat) : async Bool {
    if(m % n == 0) {
      return true;
    } else {
      return false;
    }
  };

  // Challenge 6
  public func is_even(n: Nat) : async Bool {
    if(n % 2 == 0) {
      return true;
    } 
    else  {
      return false;
    }
  };
  
  // Challenge 7
  let array = [1,2,3,4];
  public func sum_of_array () :async Nat {
    var sum = 0;
    for(value in array.vals()) {
      sum := sum + value;
    };
    return sum;
  };

  // Challenge 8
  let array2 = [2,5,12,3,22,18];
  public func getMaximumNum(array: [Nat]): async Nat {
    var max = array[0];
    Debug.print(debug_show(max));
     for(value in array.vals()) {
      if(value > max) {
        max := value;
      }
    };
    return max;
  };

  // Challenge 9
  // public func testBufferInMotoko() : async () {
  //   let a = B.Buffer<Nat>(3); // Tai sao la 3 --> 3 o day mang y nghia la gi ?
  //   for (i in I.range(0, 123)) {
  //     a.add(i);
  //   };
  //   Debug.print(debug_show(a.toArray()));
  // };

  public func remove_from_array(array: [Nat], n : Nat) :async() {
    let newArr=B.Buffer<Nat>(n);

    for(value in array.vals()) {
      if(value != n) {
        newArr.add(value);
      }
    };
    Debug.print(debug_show(newArr.toArray()));
  };

  // Challenge 10

  public func selctionSort(array: [ Nat]) : async [Nat] {

  var array_mutable = Array.thaw<Nat> (array);
  
  // var i = 0;
  var n = array.size();

  for(i in I.range(0,n -2 )) {
    // Debug.print(debug_show(i));
    var minIdx = i;
    for(j in I.range(i + 1,n - 1)) {
      if(array_mutable[minIdx] > array_mutable[j]) {
        minIdx := j;
      }
    };
        var temp = array_mutable[minIdx];
        array_mutable[minIdx] := array_mutable[i];
        array_mutable[i] := temp;
  };

  return Array.freeze(array_mutable);

  };

};
