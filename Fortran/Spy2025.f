        PROGRAM Spy2025
        IMPLICIT none
        INTEGER :: size, num1, num2, num3, locker
        print *, "Hat size?"
        read *, size
        call getNum1(size, num1)
        call getNum2(size, num2)
        call getNum3(size, num3)
        locker = num1 + num2 + num3
        print *, "Use", locker
        END PROGRAM Spy2025

        subroutine getNum1(size, num1)
           IMPLICIT none
           INTEGER, intent(in) :: size
           INTEGER, intent(out) :: num1
           num1 = MOD(size,10) * 100
        end subroutine getNum1

        subroutine getNum2(size, num2)
           IMPLICIT none
           INTEGER, intent(in) :: size
           INTEGER, intent(out) :: num2
           num2 = MOD(size,1000)
           num2 = num2 - MOD(size,100)
           num2 = num2 / 10
        end subroutine getNum2
        
        subroutine getNum3(size, num3)
           IMPLICIT none
           INTEGER, intent(in) :: size
           INTEGER, intent(out) :: num3
           num3 = MOD(size, 10**6)
           num3 = num3 - MOD(size, 10**5)
           num3 = num3 / 10**5
        end subroutine getNum3


