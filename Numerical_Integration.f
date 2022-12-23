		
c--------------------------COS DEL PROGRAMA ----------------------------
		PROGRAM integracio numerica
		implicit none
		external YCrommelin
c------------------------- DECLARACIO DE VAR. -------------------------
		integer m
		double precision x1,x2,a,b,h,At,As,pi,YCrommelin
		parameter (a=1376.3d0*10**6) !km
		parameter (b=542.617d0*10**6) !km
		parameter (pi = 4.d0*atan(1.d0))
		open (1,file = "P4-20-21-c2.dat")
c------------------------- APARTAT c) -------------------------
c 		Escriurem en un fitxer la integral donada pel guió amb els límits donats
		x1 = -3.d0*b
		x2 = -2.d0*b
		do m = 4,22,1 
			h = (x2-x1)/2**m
			call trapezoids (x1,x2,m,YCrommelin,At)
			call simpson (x1,x2,m,YCrommelin,As)
			write(1,200) h, 4.d0*At,4.d0*As
		enddo
		write (1,"(a1)") 
		write (1,"(a1)")
		print *, pi*a*b
		call system ("gnuplot -p plot1.gnu")
c------------------------- APARTAT 2) -------------------------
c 		Escriurem en un fitxer la integral donada pel guió amb els límits donats
		x2 = -2.d0*b
		x1= -5.d0*b/2.d0
		do m = 4,22,1 
			h = (x2-x1)/2**m
			call trapezoids (x1,x2,m,YCrommelin,At)
			call simpson (x1,x2,m,YCrommelin,As)
			write(1,200) h, At, As
		enddo
		write (1,"(a1)") 
		write (1,"(a1)")
		print *, a*b*(3.d0*sqrt(3.d0)+2.d0*pi)/24.d0
		call system ("gnuplot -p plot2.gnu")

200     format(e20.14,2x,e20.14,2x,e20.14)

		END PROGRAM

c------------------------ Funcions i subroutines-----------------------
c 		Funcions i subrutines utilitzades en aquest programa

c-------------------------subroutine trapezoids-------------------------

c 		Subrutine que calcula la integral amb el mètode dels trapezis repetit
c 		Té per entrada els extrems, la funció a integrar i els k de 2^k intervals
c 		Té per surtida la integral calculada
		double precision function YCrommelin(x)
		implicit none
		double precision x, a, b
		parameter (a=1376.3d0*10**6) !km
		parameter (b=542.617d0*10**6) !km

			YCrommelin = a*sqrt(1.d0-(((x+2.d0*b)**2)/b**2))
		return
		end function YCrommelin

		subroutine trapezoids (x1,x2,k,funci,integral)
		implicit none
		external funci
		double precision x1,x2,integral,h,funci,xk
		integer s,k,interval

		interval  = 2**k
		h = (x2-x1)/interval !valor dels intervals
		integral = h*(funci(x1)+funci(x2))/2.d0 !extrems
		do s = 1, interval-1
			xk = x1 + s*h
			integral = integral + funci(xk)*h !funcions dins
		enddo

		end subroutine trapezoids 


c-------------------------subroutine simpson----------------------------

c 		Subrutine que calcula la integral amb el mètode de simpson repetit
c 		Té per entrada els extrems, la funció a integrar i els k de 2^k intervals
c 		Té per surtida la integral calculada

		subroutine simpson (x1,x2,k,funci,integral)
		implicit none
		external funci
		double precision x1,x2,integral,h,funci, xk
		integer s,k, interval
		interval = 2**k
		h = (x2-x1)/interval !valors intervals
		integral = (funci(x1)+funci(x2))*h/3.d0 !integral extrems
		do s = 1, 2**k-1
			xk = x1 + s*h
			if (mod(s,2).EQ.0) then 
				integral = integral + (h*2.d0*funci(xk))/3.d0!integral valors interns parells
			else
				integral = integral + (h*4.d0*funci(xk))/3.d0!integral valors interns senars
			endif
		enddo
		end subroutine simpson
