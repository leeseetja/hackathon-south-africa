 MODULE INTER_MOD
   IMPLICIT NONE

    CONTAINS

   SUBROUTINE INTERP(I,J,K,TEMP,LONS,LATS,LONSTAT,LATSTAT,NEW)
     IMPLICIT NONE
     INTEGER, INTENT(IN) :: I
     INTEGER, INTENT(IN) :: J
     INTEGER, INTENT(IN) :: K
     REAL, INTENT(IN) :: TEMP(I-1:I,J-1:J)
     REAL, INTENT(IN) :: LONS(I-1:I)
     REAL, INTENT(IN) :: LATS(J-1:J)
     REAL, INTENT(IN) :: LONSTAT(K:K)
     REAL, INTENT(IN) :: LATSTAT(K:K)
     REAL, INTENT(OUT) :: NEW(K:K)
!    REAL, INTENT(INOUT) :: LATSSTAT
     REAL :: VAR1
     REAL :: VAR2
       
       VAR1=(LONS(I)-LONSTAT(K))/(LONS(I)-LONS(I-1))*TEMP(I-1,J-1)+&
            (LONSTAT(K)-LONS(I-1))/(LONS(I)-LONS(I-1))*TEMP(I,J-1)
       VAR2=(LONS(I)-LONSTAT(K))/(LONS(I)-LONS(I-1))*TEMP(I-1,J)+&
            (LONSTAT(K)-LONS(I-1))/(LONS(I)-LONS(I-1))*TEMP(I-1,J)
       NEW(K)=(LATS(J)-LATSTAT(K))/(LATS(J)-LATS(J-1))*VAR1+&
            (LATSTAT(K)-LATS(J-1))/(LATS(J)-LATS(J-1))*VAR2

    END SUBROUTINE INTERP

   END MODULE INTER_MOD