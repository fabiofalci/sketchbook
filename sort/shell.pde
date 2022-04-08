class Shell {
    int[] array;
    int gap;
    int i;
    int j;

    boolean done;

    public Shell(int[] array) {
        this.array = array;
        gap = array.length / 2;
        i = gap;
        j = i - gap;
    }

    void sort() {
        println(j + " " + (j + gap) + "  " + gap);

        if (j >= 0 && array[j] > array[j + gap]) {
            int swap = array[j];
            array[j] = array[j + gap];
            array[j + gap] = swap;

            j -= gap;
        } else {
            i++;
            if (i >= array.length) {
                gap /= 2;
                if (gap <= 0) {
                    done = true;
                }
                i = gap;
            }
            j = i - gap;
        }
    }

    void drawArray(int leftMargin) {
        for (int i = 0; i < array.length; i++) {
            int elem = BOTTOM_MARGIN;
            color c = color(scaleColor(array[i]));
            // if (i == index) {
            //   c = color(255, 0, 0);
            // }
            for (int j = 0; j < array[i]; j++) {
                int column = leftMargin + i + (--elem) * screen.width;
                screen.pixels[column] = c;
            }
        }
    }
}