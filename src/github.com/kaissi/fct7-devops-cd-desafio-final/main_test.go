package main

import "testing"

func Test_soma(t *testing.T) {
	type args struct {
		x int
		y int
	}
	tests := []struct {
		name string
		args args
		want int
	}{
		{ "Soma de 3 + 5", args {3, 5}, 8 },
		{ "Soma de -4 + 5", args {-4, 5}, 1 },
		{ "Soma de -3 + 1", args {-3, 1}, -2 },
	}
	for _, tt := range tests {
		t.Run(tt.name, func (t *testing.T) {
			if got := soma(tt.args.x, tt.args.y); got != tt.want {
				t.Errorf("soma() = %v, want %v", got, tt.want)
			}
		})
	}
}