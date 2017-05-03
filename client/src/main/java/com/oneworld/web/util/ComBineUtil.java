package com.oneworld.web.util;

/**
 * Created by Master ZQ on 2017/2/15.
 */
/**
 * 对两个有序数组进行合并,并将重复的数字将其去掉
 * 已排好序的数组a
 * 已排好序的数组b
 * @return合并后的排序数组,返回数组的长度=a.length + b.length,不足部分补0
 */
public class ComBineUtil {
    public static int[] mergeByArray(int[] a, int[] b){
        int[] c = new int[a.length + b.length];

        int i = 0, j = 0, k = 0;

        while (i < a.length && j < b.length) {
            if (a[i] <= b[j]) {
                if (a[i] == b[j]) {
                    j++;
                } else {
                    c[k] = a[i];
                    i++;
                    k++;
                }
            } else {
                c[k] = b[j];
                j++;
                k++;
            }
        }
        while (i < a.length) {
            c[k] = a[i];
            k++;
            i++;
        }
        while (j < b.length) {
            c[k] = b[j];
            j++;
            k++;
        }
        return c;
    }
}
