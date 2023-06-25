#include <cstdio>

int advance_ipc()
{
    for (int i = 0; i < 3000; ++i) {
        double min_dist2 = 0;
        printf("!!!!!!! %d %.20f %d\n", i, min_dist2, i < 3000);
    }
}

int main(int argc, char* argv[])
{
    advance_ipc();

    return 0;
}
