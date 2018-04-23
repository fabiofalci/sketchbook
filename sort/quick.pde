import java.util.*;

class Quick {
  int[] array;
  List<Pivot> pivots;
  boolean done;

  public Quick(int[] array) {
    this.array = array;

    Pivot pivot = new Pivot();
    pivot.pivot = array.length - 1;
    pivot.index = 0;
    pivot.from = 0;
    pivot.to = array.length - 1;

    pivots = new ArrayList();
    pivots.add(pivot);

    //println(Arrays.toString(array));
  }

  void sort() {
    Pivot pivot = pivots.get(0);
    pivot.sort();
    if (pivot.done) {
      pivots.remove(0); 

      Pivot low = new Pivot();
      low.from = pivot.from;
      low.to = pivot.pivot - 1;
      low.index = pivot.from;
      low.pivot = pivot.pivot - 1;

      Pivot high= new Pivot();
      high.from = pivot.pivot + 1;
      high.to = pivot.to;
      high.index = pivot.pivot + 1;
      high.pivot = pivot.to;

      if (low.to - low.from > 0) {       
        pivots.add(low);
      }

      if (high.to - high.from > 0) {
        pivots.add(high);
      }
    }

    if (pivots.isEmpty()) {
      done = true;
    }
  }

  class Pivot {
    int pivot;
    int index;
    int from;
    int to;
    boolean done;

    void sort() {
      if (index == pivot) {
        done = true;
        return;
      }

      if (array[index] >= array[pivot]) {
        moveRight();
        //println(Arrays.toString(array) + " " + pivots.size() + ": " + printPivots());
      } else {
        index++;
      }
    }

    void moveRight() {
      int swap = array[pivot - 1];
      array[pivot - 1] = array[index];
      array[index] = swap;

      swap = array[pivot - 1];
      array[pivot - 1] = array[pivot];
      array[pivot] = swap;

      pivot--;
    }
  }

  void drawArray(int leftMargin) {
    for (int i = 0; i < array.length; i++) {
      int elem = BOTTOM_MARGIN;
      color c = color(0);

      for (Pivot pivot : pivots) {
        if (!pivot.done && i == pivot.pivot) {
          c = color(255, 0, 0);
          break;
        }
      }

      for (int j = 0; j < array[i]; j++) {
        int column = leftMargin + i + (--elem) * screen.width;
        screen.pixels[column] = c;
      }
    }
  }

  String printPivots() {
    StringBuilder str = new StringBuilder();
    for (Pivot pivot : pivots) {
      str.append(array[pivot.pivot] + "=" + array[pivot.index] + ", ");
    }
    return str.toString();
  }
}
