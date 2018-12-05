	.file	"SideShooter6-GameLogic.cpp"
	.text
	.p2align 2,,3
	.globl	__Z8InitMapaR5Level
	.def	__Z8InitMapaR5Level;	.scl	2;	.type	32;	.endef
__Z8InitMapaR5Level:
	movl	4(%esp), %eax
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
	ret
	.p2align 2,,3
	.globl	__Z8InitShipP9SpaceShip
	.def	__Z8InitShipP9SpaceShip;	.scl	2;	.type	32;	.endef
__Z8InitShipP9SpaceShip:
	movl	4(%esp), %eax
	movl	$270, 4(%eax)
	movl	$180, 8(%eax)
	movl	$0, (%eax)
	movl	$200, 12(%eax)
	movl	$5, 16(%eax)
	movl	$20, 20(%eax)
	movl	$20, 24(%eax)
	movl	$0, 28(%eax)
	movb	$0, 32(%eax)
	movl	$0, 36(%eax)
	movl	$0, 40(%eax)
	movl	$0, 44(%eax)
	movb	$0, 52(%eax)
	movl	$0, 56(%eax)
	movb	$0, 53(%eax)
	movb	$0, 60(%eax)
	movl	$1, 48(%eax)
	movl	$0, 64(%eax)
	movl	$0, 68(%eax)
	movl	$9, 72(%eax)
	movl	$1, 76(%eax)
	movl	$0, 88(%eax)
	movl	$4, 108(%eax)
	movl	$1, 224(%eax)
	movl	$1, 196(%eax)
	movl	$270, 152(%eax)
	movl	$180, 156(%eax)
	movl	$0, 148(%eax)
	movl	$200, 160(%eax)
	movl	$5, 164(%eax)
	movl	$20, 168(%eax)
	movl	$20, 172(%eax)
	movl	$0, 176(%eax)
	movb	$0, 180(%eax)
	movl	$0, 184(%eax)
	movl	$0, 188(%eax)
	movl	$0, 192(%eax)
	movb	$0, 200(%eax)
	movl	$0, 204(%eax)
	movb	$0, 201(%eax)
	movb	$0, 208(%eax)
	movl	$0, 212(%eax)
	movl	$0, 216(%eax)
	movl	$9, 220(%eax)
	movl	$4, 256(%eax)
	ret
	.p2align 2,,3
	.globl	__Z8DrawShipP9SpaceShip
	.def	__Z8DrawShipP9SpaceShip;	.scl	2;	.type	32;	.endef
__Z8DrawShipP9SpaceShip:
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$80, %esp
	movl	96(%esp), %ebx
	leal	48(%esp), %esi
	movl	$0, 12(%esp)
	movl	$255, 8(%esp)
	movl	$0, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	156(%ebx), %eax
	movl	152(%ebx), %edx
	leal	16(%esp), %edi
	movl	$4, %ecx
	rep movsl
	leal	10(%eax), %ecx
	movl	%ecx, 44(%esp)
	fildl	44(%esp)
	fstps	12(%esp)
	leal	10(%edx), %ecx
	movl	%ecx, 44(%esp)
	fildl	44(%esp)
	fstps	8(%esp)
	movl	%eax, 44(%esp)
	fildl	44(%esp)
	fstps	4(%esp)
	movl	%edx, 44(%esp)
	fildl	44(%esp)
	fstps	(%esp)
	call	_al_draw_filled_rectangle
	leal	64(%esp), %esi
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	8(%ebx), %eax
	movl	4(%ebx), %edx
	leal	16(%esp), %edi
	movl	$4, %ecx
	rep movsl
	leal	10(%eax), %ecx
	movl	%ecx, 44(%esp)
	fildl	44(%esp)
	fstps	12(%esp)
	leal	10(%edx), %ecx
	movl	%ecx, 44(%esp)
	fildl	44(%esp)
	fstps	8(%esp)
	movl	%eax, 44(%esp)
	fildl	44(%esp)
	fstps	4(%esp)
	movl	%edx, 44(%esp)
	fildl	44(%esp)
	fstps	(%esp)
	call	_al_draw_filled_rectangle
	addl	$80, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	ret
	.p2align 2,,3
	.globl	__Z7gravityP9SpaceShipi
	.def	__Z7gravityP9SpaceShipi;	.scl	2;	.type	32;	.endef
__Z7gravityP9SpaceShipi:
	movl	8(%esp), %eax
	leal	(%eax,%eax,8), %edx
	leal	(%eax,%edx,4), %eax
	movl	4(%esp), %edx
	leal	(%edx,%eax,4), %eax
	addl	$7, 8(%eax)
	ret
	.p2align 2,,3
	.globl	__Z12MoveShipLeftP9SpaceShipi
	.def	__Z12MoveShipLeftP9SpaceShipi;	.scl	2;	.type	32;	.endef
__Z12MoveShipLeftP9SpaceShipi:
	movl	8(%esp), %eax
	leal	(%eax,%eax,8), %edx
	leal	(%eax,%edx,4), %eax
	movl	4(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	16(%eax), %edx
	subl	%edx, 4(%eax)
	ret
	.p2align 2,,3
	.globl	__Z13MoveShipRightP9SpaceShipi
	.def	__Z13MoveShipRightP9SpaceShipi;	.scl	2;	.type	32;	.endef
__Z13MoveShipRightP9SpaceShipi:
	movl	8(%esp), %eax
	leal	(%eax,%eax,8), %edx
	leal	(%eax,%edx,4), %eax
	movl	4(%esp), %edx
	leal	(%edx,%eax,4), %eax
	movl	16(%eax), %edx
	addl	%edx, 4(%eax)
	ret
	.p2align 2,,3
	.globl	__Z4jumpP9SpaceShipPKiS2_i
	.def	__Z4jumpP9SpaceShipPKiS2_i;	.scl	2;	.type	32;	.endef
__Z4jumpP9SpaceShipPKiS2_i:
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	movl	28(%esp), %eax
	leal	(%eax,%eax,8), %edx
	leal	(%eax,%edx,4), %eax
	movl	16(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	cmpb	$0, 32(%eax)
	je	L8
	movl	40(%eax), %edx
	cmpl	$1, %edx
	jle	L17
	movb	$0, 32(%eax)
L8:
	popl	%ebx
	popl	%esi
	popl	%edi
	ret
	.p2align 2,,3
L17:
	movl	36(%eax), %ecx
	movl	44(%eax), %ebx
	movl	24(%esp), %esi
	cmpl	(%esi,%ebx,4), %ecx
	je	L18
L12:
	incl	%ecx
	movl	%ecx, 36(%eax)
	cmpl	$18, %ecx
	jle	L8
L13:
	movl	$0, 36(%eax)
	movl	$0, 44(%eax)
	incl	%edx
	movl	%edx, 40(%eax)
	movb	$0, 32(%eax)
	jmp	L8
	.p2align 2,,3
L18:
	incl	%ebx
	movl	%ebx, 44(%eax)
	movl	8(%eax), %esi
	movl	20(%esp), %edi
	subl	(%edi,%ebx,4), %esi
	movl	%esi, 8(%eax)
	testl	%esi, %esi
	jg	L12
	jmp	L13
	.p2align 2,,3
	.globl	__Z13CollidePlayerP9SpaceShipi
	.def	__Z13CollidePlayerP9SpaceShipi;	.scl	2;	.type	32;	.endef
__Z13CollidePlayerP9SpaceShipi:
	pushl	%ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	movl	20(%esp), %eax
	movl	4(%eax), %esi
	movl	20(%eax), %ebx
	movl	152(%eax), %ecx
	movl	168(%eax), %edx
	movl	%esi, %ebp
	subl	%ebx, %ebp
	leal	(%ecx,%edx), %edi
	cmpl	%edi, %ebp
	jge	L19
	addl	%esi, %ebx
	subl	%edx, %ecx
	cmpl	%ecx, %ebx
	jle	L19
	movl	8(%eax), %esi
	movl	24(%eax), %ebx
	movl	156(%eax), %ecx
	movl	172(%eax), %edx
	movl	%esi, %ebp
	subl	%ebx, %ebp
	leal	(%ecx,%edx), %edi
	cmpl	%edi, %ebp
	jge	L19
	addl	%esi, %ebx
	subl	%edx, %ecx
	cmpl	%ecx, %ebx
	jle	L19
	movl	24(%esp), %ebx
	testl	%ebx, %ebx
	jne	L21
	movb	$1, 53(%eax)
	movb	$1, 208(%eax)
	subl	$10, 160(%eax)
	.p2align 2,,3
L19:
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 2,,3
L21:
	movb	$1, 201(%eax)
	movb	$1, 60(%eax)
	subl	$10, 12(%eax)
	jmp	L19
	.p2align 2,,3
	.globl	__Z5golpeP9SpaceShipiPKiS2_
	.def	__Z5golpeP9SpaceShipiPKiS2_;	.scl	2;	.type	32;	.endef
__Z5golpeP9SpaceShipiPKiS2_:
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$8, %esp
	movl	24(%esp), %edx
	movl	28(%esp), %eax
	leal	(%eax,%eax,8), %ecx
	leal	(%eax,%ecx,4), %ecx
	leal	(%edx,%ecx,4), %ebx
	cmpb	$0, 52(%ebx)
	je	L40
	movl	48(%ebx), %ecx
	testl	%ecx, %ecx
	jne	L30
	movl	56(%ebx), %ecx
	movl	44(%ebx), %esi
	movl	36(%esp), %edi
	cmpl	(%edi,%esi,4), %ecx
	je	L31
L42:
	leal	1(%ecx), %eax
L35:
	movl	%eax, 56(%ebx)
	jmp	L29
	.p2align 2,,3
L30:
	decl	%ecx
	je	L33
L40:
	movl	56(%ebx), %eax
L29:
	cmpl	$18, %eax
	jle	L27
	movl	$0, 56(%ebx)
	movl	$0, 44(%ebx)
	movb	$0, 52(%ebx)
	movb	$0, 53(%ebx)
L27:
	addl	$8, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	ret
	.p2align 2,,3
L33:
	movl	56(%ebx), %ecx
	movl	44(%ebx), %esi
	movl	36(%esp), %edi
	cmpl	(%edi,%esi,4), %ecx
	jne	L42
	incl	%esi
	movl	%esi, 44(%ebx)
	movl	32(%esp), %edi
	movl	(%edi,%esi,4), %ecx
	addl	%ecx, 4(%ebx)
L44:
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__Z13CollidePlayerP9SpaceShipi
	cmpb	$0, 53(%ebx)
	jne	L38
	movl	56(%ebx), %eax
	incl	%eax
	jmp	L35
	.p2align 2,,3
L31:
	incl	%esi
	movl	%esi, 44(%ebx)
	movl	32(%esp), %edi
	movl	(%edi,%esi,4), %ecx
	subl	%ecx, 4(%ebx)
	jmp	L44
	.p2align 2,,3
L38:
	movl	$20, %eax
	jmp	L35
	.p2align 2,,3
	.globl	__Z3hitP9SpaceShipPKiS2_iPKf
	.def	__Z3hitP9SpaceShipPKiS2_iPKf;	.scl	2;	.type	32;	.endef
__Z3hitP9SpaceShipPKiS2_iPKf:
	pushl	%ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	%ebp
	movl	36(%esp), %edx
	leal	(%edx,%edx,8), %eax
	leal	(%edx,%eax,4), %eax
	movl	24(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	44(%eax), %esi
	leal	0(,%esi,4), %ecx
	movl	28(%esp), %ebx
	movl	(%ebx,%ecx), %edi
	movl	64(%eax), %ebx
	movl	40(%esp), %ebp
	flds	0(%ebp,%ebx,4)
	cmpb	$0, 60(%eax)
	je	L60
	pushl	%edi
	fimull	(%esp)
	popl	%edi
	addl	$11, %edx
	andl	$-2147483647, %edx
	js	L57
L48:
	leal	(%edx,%edx,8), %edi
	leal	(%edx,%edi,4), %edx
	movl	24(%esp), %edi
	movl	48(%edi,%edx,4), %edx
	testl	%edx, %edx
	je	L58
	decl	%edx
	movl	56(%eax), %edx
	je	L52
	fstp	%st(0)
L51:
	cmpl	$18, %edx
	jle	L45
	movl	$0, 56(%eax)
	movl	$0, 44(%eax)
	movb	$0, 52(%eax)
	movb	$0, 60(%eax)
	incl	%ebx
	movl	%ebx, 64(%eax)
	jmp	L45
	.p2align 2,,3
L60:
	fstp	%st(0)
L45:
	popl	%esi
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 2,,3
L58:
	movl	56(%eax), %edx
	movl	32(%esp), %ebp
	cmpl	0(%ebp,%ecx), %edx
	je	L59
	fstp	%st(0)
	jmp	L53
	.p2align 2,,3
L61:
	fstp	%st(0)
	.p2align 2,,3
L53:
	incl	%edx
	movl	%edx, 56(%eax)
	jmp	L51
	.p2align 2,,3
L57:
	decl	%edx
	orl	$-2, %edx
	incl	%edx
	jmp	L48
	.p2align 2,,3
L59:
	incl	%esi
	movl	%esi, 44(%eax)
	fisubrl	4(%eax)
L56:
	fnstcw	2(%esp)
	movw	2(%esp), %cx
	movb	$12, %ch
	movw	%cx, (%esp)
	fldcw	(%esp)
	fistpl	4(%eax)
	fldcw	2(%esp)
	jmp	L53
	.p2align 2,,3
L52:
	movl	32(%esp), %edi
	cmpl	(%edi,%ecx), %edx
	jne	L61
	incl	%esi
	movl	%esi, 44(%eax)
	fiaddl	4(%eax)
	jmp	L56
	.p2align 2,,3
	.globl	__Z12UpdateSpriteP9SpaceShipi
	.def	__Z12UpdateSpriteP9SpaceShipi;	.scl	2;	.type	32;	.endef
__Z12UpdateSpriteP9SpaceShipi:
	movl	8(%esp), %eax
	leal	(%eax,%eax,8), %edx
	leal	(%eax,%edx,4), %eax
	movl	4(%esp), %edx
	leal	(%edx,%eax,4), %eax
	movl	128(%eax), %edx
	incl	%edx
	movl	%edx, 128(%eax)
	cmpl	124(%eax), %edx
	jl	L63
	movl	$0, 128(%eax)
	movl	104(%eax), %edx
	incl	%edx
	movl	%edx, 104(%eax)
	cmpl	100(%eax), %edx
	jge	L64
	imull	96(%eax), %edx
L65:
	movl	%edx, 116(%eax)
	movl	108(%eax), %edx
	imull	92(%eax), %edx
	movl	%edx, 120(%eax)
L63:
	movl	140(%eax), %edx
	addl	%edx, 132(%eax)
	movl	144(%eax), %edx
	addl	%edx, 136(%eax)
	ret
	.p2align 2,,3
L64:
	movl	$0, 104(%eax)
	xorl	%edx, %edx
	jmp	L65
	.p2align 2,,3
	.globl	__Z10initSpriteP9SpaceShipi
	.def	__Z10initSpriteP9SpaceShipi;	.scl	2;	.type	32;	.endef
__Z10initSpriteP9SpaceShipi:
	movl	4(%esp), %edx
	movl	8(%esp), %eax
	leal	(%eax,%eax,8), %ecx
	leal	(%eax,%ecx,4), %eax
	leal	(%edx,%eax,4), %eax
	movl	$100, 92(%eax)
	movl	$100, 96(%eax)
	movl	$10, 100(%eax)
	movl	$0, 104(%eax)
	movl	$4, 108(%eax)
	movl	$5, 112(%eax)
	movl	$0, 116(%eax)
	movl	$0, 120(%eax)
	movl	$6, 124(%eax)
	movl	$0, 128(%eax)
	movl	4(%edx), %ecx
	movl	%ecx, 132(%eax)
	movl	8(%edx), %edx
	movl	%edx, 136(%eax)
	movl	$4, 140(%eax)
	movl	$0, 144(%eax)
	ret
	.p2align 2,,3
	.globl	__Z10InitBulletP6Bullet
	.def	__Z10InitBulletP6Bullet;	.scl	2;	.type	32;	.endef
__Z10InitBulletP6Bullet:
	movl	4(%esp), %eax
	xorl	%edx, %edx
	.p2align 2,,3
L68:
	movl	$1, (%eax)
	movl	$10, 16(%eax)
	movb	$0, 12(%eax)
	incl	%edx
	addl	$24, %eax
	cmpl	$10, %edx
	jne	L68
	ret
	.p2align 2,,3
	.globl	__Z10DrawBulletP6BulletP9SpaceShipi
	.def	__Z10DrawBulletP6BulletP9SpaceShipi;	.scl	2;	.type	32;	.endef
__Z10DrawBulletP6BulletP9SpaceShipi:
	pushl	%ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	movl	104(%esp), %eax
	leal	(%eax,%eax,8), %edx
	leal	(%eax,%edx,4), %ebp
	movl	100(%esp), %ecx
	leal	(%ecx,%ebp,4), %ebp
	movl	76(%ebp), %ebx
	testl	%ebx, %ebx
	jle	L70
	movl	96(%esp), %ebx
	xorl	%eax, %eax
	leal	48(%esp), %edx
	movl	%edx, 36(%esp)
	leal	12(%esp), %edx
	movl	%edx, 40(%esp)
	jmp	L73
	.p2align 2,,3
L72:
	incl	%eax
	addl	$24, %ebx
	cmpl	%eax, 76(%ebp)
	jle	L70
L73:
	movl	84(%ebp), %edx
	movl	%edx, 16(%ebx)
	cmpb	$0, 12(%ebx)
	je	L72
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	leal	48(%esp), %edx
	movl	%edx, (%esp)
	movl	%eax, 32(%esp)
	call	_al_map_rgb
	movl	$4, %ecx
	movl	40(%esp), %edi
	movl	36(%esp), %esi
	rep movsl
	movl	$0x40000000, 8(%esp)
	movl	8(%ebx), %edx
	subl	$80, %edx
	movl	%edx, 44(%esp)
	fildl	44(%esp)
	fstps	4(%esp)
	movl	4(%ebx), %edx
	addl	$15, %edx
	movl	%edx, 44(%esp)
	fildl	44(%esp)
	fstps	(%esp)
	call	_al_draw_filled_circle
	movl	32(%esp), %eax
	incl	%eax
	addl	$24, %ebx
	cmpl	%eax, 76(%ebp)
	jg	L73
L70:
	addl	$76, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.section .rdata,"dr"
LC6:
	.ascii "jogador %d TA NO SOCO\12\12\0"
	.text
	.p2align 2,,3
	.globl	__Z10FireBulletP6BulletP9SpaceShipi
	.def	__Z10FireBulletP6BulletP9SpaceShipi;	.scl	2;	.type	32;	.endef
__Z10FireBulletP6BulletP9SpaceShipi:
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	movl	32(%esp), %ecx
	movl	40(%esp), %edi
	leal	(%edi,%edi,8), %eax
	leal	(%edi,%eax,4), %esi
	movl	36(%esp), %eax
	leal	(%eax,%esi,4), %esi
	movl	76(%esi), %ebx
	testl	%ebx, %ebx
	jle	L89
	cmpb	$0, 12(%ecx)
	je	L81
	leal	24(%ecx), %eax
	xorl	%edx, %edx
	jmp	L82
	.p2align 2,,3
L85:
	movl	%eax, %ecx
	addl	$24, %eax
	cmpb	$0, -12(%eax)
	je	L81
L82:
	incl	%edx
	cmpl	%ebx, %edx
	jne	L85
L89:
	movl	88(%esi), %eax
L79:
	testl	%eax, %eax
	jne	L77
	movl	%edi, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	movl	$9, 72(%esi)
	movl	$0, 88(%esi)
	movl	$4, 108(%esi)
L77:
	addl	$16, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	ret
	.p2align 2,,3
L81:
	movl	48(%esi), %eax
	testl	%eax, %eax
	movl	4(%esi), %eax
	jne	L83
	subl	$10, %eax
	movl	%eax, 4(%ecx)
	movl	$0, 20(%ecx)
L84:
	movl	8(%esi), %eax
	movl	%eax, 8(%ecx)
	movb	$1, 12(%ecx)
	movl	88(%esi), %eax
	decl	%eax
	movl	%eax, 88(%esi)
	jmp	L79
	.p2align 2,,3
L83:
	addl	$10, %eax
	movl	%eax, 4(%ecx)
	movl	$1, 20(%ecx)
	jmp	L84
	.p2align 2,,3
	.globl	__Z12UpdateBulletP6BulletP9SpaceShipi
	.def	__Z12UpdateBulletP6BulletP9SpaceShipi;	.scl	2;	.type	32;	.endef
__Z12UpdateBulletP6BulletP9SpaceShipi:
	movl	12(%esp), %eax
	leal	(%eax,%eax,8), %edx
	leal	(%eax,%edx,4), %eax
	movl	8(%esp), %ecx
	leal	(%ecx,%eax,4), %eax
	movl	76(%eax), %edx
	testl	%edx, %edx
	jle	L90
	movl	4(%esp), %eax
	leal	(%edx,%edx,2), %edx
	leal	(%eax,%edx,8), %ecx
	jmp	L97
	.p2align 2,,3
L94:
	addl	16(%eax), %edx
	movl	%edx, 4(%eax)
L95:
	cmpl	$1080, %edx
	jle	L93
	movb	$0, 12(%eax)
L93:
	addl	$24, %eax
	cmpl	%ecx, %eax
	je	L90
L97:
	cmpb	$0, 12(%eax)
	je	L93
	movl	20(%eax), %edx
	testl	%edx, %edx
	movl	4(%eax), %edx
	jg	L94
	subl	16(%eax), %edx
	movl	%edx, 4(%eax)
	jmp	L95
	.p2align 2,,3
L90:
	ret
	.p2align 2,,3
	.globl	__Z13CollideBulletP6BulletP9SpaceShipi
	.def	__Z13CollideBulletP6BulletP9SpaceShipi;	.scl	2;	.type	32;	.endef
__Z13CollideBulletP6BulletP9SpaceShipi:
	pushl	%ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	%esi
	movl	28(%esp), %ebx
	movl	32(%esp), %eax
	leal	11(%eax), %edx
	andl	$-2147483647, %edx
	js	L108
L101:
	leal	(%eax,%eax,8), %ecx
	leal	(%eax,%ecx,4), %eax
	leal	(%ebx,%eax,4), %eax
	movl	%eax, (%esp)
	movl	76(%eax), %ecx
	testl	%ecx, %ecx
	jle	L100
	leal	(%edx,%edx,8), %eax
	leal	(%edx,%eax,4), %eax
	leal	(%ebx,%eax,4), %edx
	movl	24(%esp), %eax
	leal	(%ecx,%ecx,2), %ecx
	leal	(%eax,%ecx,8), %edi
	.p2align 2,,3
L104:
	cmpb	$0, 12(%eax)
	je	L103
	movl	4(%eax), %ecx
	movl	4(%edx), %esi
	movl	20(%edx), %ebx
	movl	%esi, %ebp
	subl	%ebx, %ebp
	cmpl	%ebp, %ecx
	jle	L103
	addl	%esi, %ebx
	cmpl	%ebx, %ecx
	jge	L103
	movl	8(%eax), %ecx
	movl	8(%edx), %esi
	movl	24(%edx), %ebx
	movl	%esi, %ebp
	subl	%ebx, %ebp
	cmpl	%ebp, %ecx
	jle	L103
	addl	%esi, %ebx
	cmpl	%ebx, %ecx
	jge	L103
	movl	(%esp), %ebx
	movl	80(%ebx), %ecx
	subl	%ecx, 12(%edx)
	incl	28(%ebx)
	movb	$0, 12(%eax)
	.p2align 2,,3
L103:
	addl	$24, %eax
	cmpl	%edi, %eax
	jne	L104
L100:
	popl	%ebx
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 2,,3
L108:
	decl	%edx
	orl	$-2, %edx
	incl	%edx
	jmp	L101
	.p2align 2,,3
	.globl	__Z9InitCometP5Cometi
	.def	__Z9InitCometP5Cometi;	.scl	2;	.type	32;	.endef
__Z9InitCometP5Cometi:
	movl	8(%esp), %edx
	testl	%edx, %edx
	jle	L109
	movl	4(%esp), %eax
	addl	$16, %eax
	sall	$5, %edx
	addl	%eax, %edx
	.p2align 2,,3
L111:
	movl	$2, -16(%eax)
	movb	$0, (%eax)
	movl	$10, 4(%eax)
	movl	$18, 8(%eax)
	movl	$18, 12(%eax)
	addl	$32, %eax
	cmpl	%edx, %eax
	jne	L111
L109:
	ret
	.p2align 2,,3
	.globl	__Z9DrawCometP5Cometi
	.def	__Z9DrawCometP5Cometi;	.scl	2;	.type	32;	.endef
__Z9DrawCometP5Cometi:
	pushl	%ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$124, %esp
	movl	148(%esp), %edi
	testl	%edi, %edi
	jle	L114
	movl	144(%esp), %ebx
	xorl	%ebp, %ebp
	leal	64(%esp), %eax
	movl	%eax, 40(%esp)
	leal	12(%esp), %eax
	movl	%eax, 44(%esp)
	jmp	L122
	.p2align 2,,3
L130:
	jle	L128
	cmpl	$2, %eax
	je	L119
	cmpl	$3, %eax
	je	L129
L116:
	incl	%ebp
	addl	$32, %ebx
	cmpl	148(%esp), %ebp
	je	L114
L122:
	cmpb	$0, 16(%ebx)
	je	L116
	movl	4(%ebx), %eax
	cmpl	$1, %eax
	jne	L130
	movl	$0, 12(%esp)
	movl	$25, 8(%esp)
	movl	$255, 4(%esp)
	leal	64(%esp), %eax
	movl	%eax, (%esp)
	call	_al_map_rgb
	movl	$4, %ecx
	movl	44(%esp), %edi
	movl	40(%esp), %esi
L126:
	rep movsl
	movl	$0x41a00000, 8(%esp)
	fildl	12(%ebx)
	fstps	4(%esp)
	fildl	8(%ebx)
	fstps	(%esp)
	call	_al_draw_filled_circle
	incl	%ebp
	addl	$32, %ebx
	cmpl	148(%esp), %ebp
	jne	L122
L114:
	addl	$124, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 2,,3
L129:
	leal	96(%esp), %esi
	movl	$45, 12(%esp)
	movl	$25, 8(%esp)
	movl	$5, 4(%esp)
L127:
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	$4, %ecx
	movl	44(%esp), %edi
	jmp	L126
	.p2align 2,,3
L119:
	leal	80(%esp), %esi
	movl	$95, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	jmp	L127
	.p2align 2,,3
L128:
	testl	%eax, %eax
	jne	L116
	leal	48(%esp), %esi
	movl	$0, 12(%esp)
	movl	$255, 8(%esp)
	movl	$25, 4(%esp)
	jmp	L127
	.section .rdata,"dr"
LC8:
	.ascii "\12 %d\0"
LC9:
	.ascii "%d\0"
	.text
	.p2align 2,,3
	.globl	__Z10StartCometP5Cometi
	.def	__Z10StartCometP5Cometi;	.scl	2;	.type	32;	.endef
__Z10StartCometP5Cometi:
	pushl	%ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	48(%esp), %ebx
	movl	52(%esp), %edi
	testl	%edi, %edi
	jle	L131
	xorl	%esi, %esi
	movl	$250, %ebp
	jmp	L136
	.p2align 2,,3
L134:
	incl	%esi
	addl	$32, %ebx
	cmpl	%edi, %esi
	je	L131
L136:
	cmpb	$0, 16(%ebx)
	jne	L134
	call	_rand
	cltd
	idivl	%ebp
	testl	%edx, %edx
	jne	L134
	movb	$1, 16(%ebx)
	call	_rand
	movl	$580, %ecx
	cltd
	idivl	%ecx
	addl	$200, %edx
	movl	%edx, 8(%ebx)
	movl	%esi, 4(%esp)
	movl	$LC8, (%esp)
	call	_printf
	movl	$0, 12(%ebx)
	call	_rand
	andl	$-2147483645, %eax
	js	L140
L135:
	movl	%eax, 4(%ebx)
	movl	%eax, 52(%esp)
	movl	$LC9, 48(%esp)
	addl	$28, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	jmp	_printf
	.p2align 2,,3
L131:
	addl	$28, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
L140:
	decl	%eax
	orl	$-4, %eax
	incl	%eax
	jmp	L135
	.p2align 2,,3
	.globl	__Z11UpdateCometP5Cometi
	.def	__Z11UpdateCometP5Cometi;	.scl	2;	.type	32;	.endef
__Z11UpdateCometP5Cometi:
	movl	8(%esp), %ecx
	testl	%ecx, %ecx
	jle	L141
	movl	4(%esp), %eax
	sall	$5, %ecx
	addl	%eax, %ecx
	.p2align 2,,3
L146:
	cmpb	$0, 16(%eax)
	movl	12(%eax), %edx
	je	L144
	addl	20(%eax), %edx
	movl	%edx, 12(%eax)
L144:
	cmpl	$399, %edx
	jle	L145
	movl	$400, 12(%eax)
L145:
	addl	$32, %eax
	cmpl	%ecx, %eax
	jne	L146
L141:
	ret
	.p2align 2,,3
	.globl	__Z12CollideCometP5CometiiP9SpaceShip
	.def	__Z12CollideCometP5CometiiP9SpaceShip;	.scl	2;	.type	32;	.endef
__Z12CollideCometP5CometiiP9SpaceShip:
	pushl	%ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$8, %esp
	movl	32(%esp), %edx
	movl	36(%esp), %eax
	testl	%edx, %edx
	jle	L149
	leal	(%eax,%eax,8), %ecx
	leal	(%eax,%ecx,4), %ecx
	movl	40(%esp), %eax
	leal	(%eax,%ecx,4), %ebp
	movl	28(%esp), %eax
	addl	$16, %eax
	sall	$5, %edx
	addl	%eax, %edx
	movl	%edx, (%esp)
	jmp	L162
	.p2align 2,,3
L166:
	movl	-4(%eax), %edx
L154:
	cmpl	$719, %edx
	jle	L152
	movb	$0, (%eax)
L152:
	addl	$32, %eax
	cmpl	(%esp), %eax
	je	L149
L162:
	cmpb	$0, (%eax)
	je	L152
	movl	-8(%eax), %esi
	movl	8(%eax), %ebx
	movl	4(%ebp), %ecx
	movl	20(%ebp), %edx
	movl	%esi, %edi
	subl	%ebx, %edi
	movl	%edi, 4(%esp)
	leal	(%ecx,%edx), %edi
	cmpl	%edi, 4(%esp)
	jge	L166
	addl	%esi, %ebx
	subl	%edx, %ecx
	movl	-4(%eax), %edx
	cmpl	%ecx, %ebx
	jle	L154
	movl	12(%eax), %esi
	movl	8(%ebp), %ebx
	movl	24(%ebp), %ecx
	movl	%edx, %edi
	subl	%esi, %edi
	movl	%edi, 4(%esp)
	leal	(%ebx,%ecx), %edi
	cmpl	%edi, 4(%esp)
	jge	L154
	addl	%edx, %esi
	subl	%ecx, %ebx
	cmpl	%ebx, %esi
	jle	L154
	movb	$0, (%eax)
	movl	-12(%eax), %ecx
	movl	%ecx, 72(%ebp)
	cmpl	$1, %ecx
	je	L157
	jle	L167
	cmpl	$2, %ecx
	je	L158
	cmpl	$3, %ecx
	jne	L154
	movl	$15, 84(%ebp)
	movl	$1, 76(%ebp)
	movl	$1, 88(%ebp)
	movl	$50, 80(%ebp)
	movl	$3, 108(%ebp)
	jmp	L154
	.p2align 2,,3
L149:
	addl	$8, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
L157:
	movl	$10, 84(%ebp)
	movl	$10, 76(%ebp)
	movl	$2, 80(%ebp)
	movl	$10, 88(%ebp)
	movl	$0, 108(%ebp)
	jmp	L154
L158:
	movl	$7, 84(%ebp)
	movl	$2, 76(%ebp)
	movl	$30, 80(%ebp)
	movl	$2, 88(%ebp)
	movl	$1, 108(%ebp)
	jmp	L154
L167:
	testl	%ecx, %ecx
	jne	L154
	movl	$5, 84(%ebp)
	movl	$4, 76(%ebp)
	movl	$5, 80(%ebp)
	movl	$4, 88(%ebp)
	movl	$2, 108(%ebp)
	jmp	L154
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC10:
	.ascii "Falha ao inicializar o addon de imagens\0"
LC11:
	.ascii "Falha ao inicializar o mouse\0"
LC13:
	.ascii "arial.ttf\0"
LC14:
	.ascii "telaInicial.jpg\0"
LC15:
	.ascii "luvinha.png\0"
LC16:
	.ascii "preto.png\0"
LC17:
	.ascii "mapa01.jpg\0"
LC18:
	.ascii "mapaG1.jpg\0"
LC19:
	.ascii "Falha ao carregar telainicial\0"
LC20:
	.ascii "Falha ao carregar sprites\0"
LC21:
	.ascii "Falha ao carregar boneco\0"
LC22:
	.ascii "Falha ao carregar o mapa\0"
	.align 4
LC23:
	.ascii "Falha ao carregar o mapa grande\0"
LC24:
	.ascii "Falha ao carregar boneco 1\0"
LC25:
	.ascii "sprite.png\0"
	.align 4
LC26:
	.ascii "jogador 1==%d/%d        jogador 0==%d/%d\12\12\0"
LC27:
	.ascii "POS X = %d\12\0"
LC28:
	.ascii "POS Y = %d\12\0"
LC29:
	.ascii "come\347o\0"
LC30:
	.ascii "telaSelection.jpg\0"
LC31:
	.ascii "como jogar\0"
LC32:
	.ascii "credit\0"
LC33:
	.ascii "PERSO 1 <d\0"
LC34:
	.ascii "%d\12\0"
LC35:
	.ascii "PERSO 1 >d\0"
LC36:
	.ascii "PERSO 2<d\0"
LC37:
	.ascii "PERSO 2>d\0"
LC38:
	.ascii "g\0"
LC39:
	.ascii "d\0"
LC40:
	.ascii "A\0"
LC41:
	.ascii "Rodada = %d\12\0"
LC42:
	.ascii "B\0"
LC43:
	.ascii "C\0"
LC44:
	.ascii "D\0"
LC45:
	.ascii "azul.png\0"
LC46:
	.ascii "cinza.png\0"
LC47:
	.ascii "laranja.png\0"
LC48:
	.ascii "amarelo.png\0"
LC49:
	.ascii "rosa.png\0"
LC50:
	.ascii "verde.png\0"
LC51:
	.ascii "vermelho.png\0"
LC52:
	.ascii "mapa02.png\0"
LC53:
	.ascii "MapaG2.png\0"
LC54:
	.ascii "mapa03.png\0"
	.align 4
LC71:
	.ascii "Player 1                              %i     X     %i                                 Player2\0"
LC82:
	.ascii "Versao brasileira\0"
LC83:
	.ascii "   IFSC Studios\0"
	.data
	.align 32
LC0:
	.long	60
	.long	55
	.long	45
	.long	43
	.long	38
	.long	31
	.long	25
	.long	15
	.long	10
	.long	5
	.align 32
LC1:
	.long	30
	.long	30
	.long	40
	.long	43
	.long	38
	.long	31
	.long	25
	.long	15
	.long	10
	.long	5
	.align 32
LC2:
	.long	2
	.long	4
	.long	6
	.long	8
	.long	12
	.long	13
	.long	15
	.long	16
	.long	17
	.long	19
	.align 32
LC3:
	.long	1036831949
	.long	1045220557
	.long	1050253722
	.long	1053609165
	.long	1056964608
	.long	1058642330
	.long	1060320051
	.long	1061997773
	.long	1063675494
	.long	1065353216
	.long	1067030938
	.long	1067869798
	.long	1068289229
	.long	1068708659
	.long	1069547520
	.long	1070386381
	.long	1071225242
	.long	1072064102
	.long	1072902963
	.long	1073741824
	.section	.text.startup,"x"
	.p2align 2,,3
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	andl	$-16, %esp
	subl	$1984, %esp
	call	___main
	leal	944(%esp), %eax
	movl	%eax, 204(%esp)
	movl	$LC0, %esi
	movl	$10, %ecx
	movl	%eax, %edi
	rep movsl
	leal	984(%esp), %edx
	movl	%edx, 200(%esp)
	movl	$LC1, %esi
	movb	$10, %cl
	movl	%edx, %edi
	rep movsl
	leal	1024(%esp), %eax
	movl	%eax, 196(%esp)
	movl	$LC2, %esi
	movb	$10, %cl
	movl	%eax, %edi
	rep movsl
	leal	1128(%esp), %edx
	movl	%edx, 192(%esp)
	movl	$LC3, %esi
	movb	$20, %cl
	movl	%edx, %edi
	rep movsl
	movl	$_atexit, 4(%esp)
	movl	$83888641, (%esp)
	call	_al_install_system
	testb	%al, %al
	je	L447
	movl	$720, 4(%esp)
	movl	$1080, (%esp)
	call	_al_create_display
	movl	%eax, 160(%esp)
	call	_al_init_image_addon
	testb	%al, %al
	je	L451
	movl	160(%esp), %eax
	testl	%eax, %eax
	je	L447
	call	_al_install_mouse
	testb	%al, %al
	je	L452
	call	_al_init_primitives_addon
	call	_al_install_keyboard
	call	_al_init_font_addon
	call	_al_init_ttf_addon
	call	_al_create_event_queue
	movl	%eax, %ebx
	movl	$286331153, (%esp)
	movl	$1066471697, 4(%esp)
	call	_al_create_timer
	movl	%eax, 144(%esp)
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	movl	$0, 8(%esp)
	movl	$18, 4(%esp)
	movl	$LC13, (%esp)
	call	_al_load_font
	movl	%eax, 128(%esp)
	movl	$0, 8(%esp)
	movl	$30, 4(%esp)
	movl	$LC13, (%esp)
	call	_al_load_font
	movl	%eax, 112(%esp)
	movl	$0, 8(%esp)
	movl	$60, 4(%esp)
	movl	$LC13, (%esp)
	call	_al_load_font
	movl	%eax, 108(%esp)
	movl	$LC14, (%esp)
	call	_al_load_bitmap
	movl	%eax, 164(%esp)
	movl	$LC15, (%esp)
	call	_al_load_bitmap
	movl	%eax, 156(%esp)
	movl	$LC16, (%esp)
	call	_al_load_bitmap
	movl	%eax, 140(%esp)
	movl	$LC16, (%esp)
	call	_al_load_bitmap
	movl	%eax, 132(%esp)
	movl	$LC17, (%esp)
	call	_al_load_bitmap
	movl	%eax, 136(%esp)
	movl	$LC18, (%esp)
	call	_al_load_bitmap
	movl	%eax, 124(%esp)
	movl	164(%esp), %eax
	testl	%eax, %eax
	je	L453
	cmpl	$0, 156(%esp)
	je	L446
	cmpl	$0, 140(%esp)
	je	L454
	cmpl	$0, 136(%esp)
	je	L455
	cmpl	$0, 124(%esp)
	je	L456
	cmpl	$0, 132(%esp)
	je	L457
	movl	$LC25, (%esp)
	call	_al_load_bitmap
	movl	%eax, 152(%esp)
	testl	%eax, %eax
	je	L446
	leal	224(%esp), %esi
	movl	$255, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	leal	4(%esp), %edx
	movl	%edx, 176(%esp)
	movl	$4, %ecx
	movl	%edx, %edi
	rep movsl
	movl	152(%esp), %eax
	movl	%eax, (%esp)
	call	_al_convert_mask_to_alpha
	movl	$LC25, (%esp)
	call	_al_load_bitmap
	movl	%eax, 148(%esp)
	testl	%eax, %eax
	je	L446
	leal	240(%esp), %esi
	movl	$255, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	$4, %ecx
	movl	176(%esp), %edi
	rep movsl
	movl	148(%esp), %eax
	movl	%eax, (%esp)
	call	_al_convert_mask_to_alpha
	leal	256(%esp), %esi
	movl	$255, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	$4, %ecx
	movl	176(%esp), %edi
	rep movsl
	movl	140(%esp), %eax
	movl	%eax, (%esp)
	call	_al_convert_mask_to_alpha
	leal	272(%esp), %esi
	movl	$255, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	$4, %ecx
	movl	176(%esp), %edi
	rep movsl
	movl	132(%esp), %eax
	movl	%eax, (%esp)
	call	_al_convert_mask_to_alpha
	leal	288(%esp), %esi
	movl	$255, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	$4, %ecx
	movl	176(%esp), %edi
	rep movsl
	movl	136(%esp), %eax
	movl	%eax, (%esp)
	call	_al_convert_mask_to_alpha
	leal	304(%esp), %esi
	movl	$255, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	$4, %ecx
	movl	176(%esp), %edi
	rep movsl
	movl	124(%esp), %eax
	movl	%eax, (%esp)
	call	_al_convert_mask_to_alpha
	leal	1688(%esp), %edx
	movl	%edx, 208(%esp)
	movl	%edx, (%esp)
	call	__Z8InitShipP9SpaceShip
	leal	1208(%esp), %eax
	leal	1448(%esp), %edx
	movl	%edx, 212(%esp)
	.p2align 2,,3
L182:
	movl	$1, (%eax)
	movl	$10, 16(%eax)
	movb	$0, 12(%eax)
	addl	$24, %eax
	cmpl	212(%esp), %eax
	jne	L182
	leal	1448(%esp), %eax
	.p2align 2,,3
L183:
	movl	$1, (%eax)
	movl	$10, 16(%eax)
	movb	$0, 12(%eax)
	addl	$24, %eax
	cmpl	208(%esp), %eax
	jne	L183
	movl	$2, 912(%esp)
	movb	$0, 928(%esp)
	movl	$10, 932(%esp)
	movl	$18, 936(%esp)
	movl	$18, 940(%esp)
	movl	$0, 4(%esp)
	leal	1688(%esp), %eax
	movl	%eax, (%esp)
	call	__Z10initSpriteP9SpaceShipi
	movl	$1, 4(%esp)
	leal	1688(%esp), %edx
	movl	%edx, (%esp)
	call	__Z10initSpriteP9SpaceShipi
	call	_al_get_keyboard_event_source
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	_al_register_event_source
	movl	144(%esp), %eax
	movl	%eax, (%esp)
	call	_al_get_timer_event_source
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	_al_register_event_source
	movl	160(%esp), %eax
	movl	%eax, (%esp)
	call	_al_get_display_event_source
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	_al_register_event_source
	call	_al_get_mouse_event_source
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	_al_register_event_source
	movl	144(%esp), %eax
	movl	%eax, (%esp)
	call	_al_start_timer
	movl	$0, 120(%esp)
	movl	$0, 104(%esp)
	movl	$0, 92(%esp)
	movl	$0, 116(%esp)
	movl	$1, 168(%esp)
	movb	$1, 174(%esp)
	leal	864(%esp), %edx
	movl	%edx, 188(%esp)
	leal	880(%esp), %eax
	movl	%eax, 184(%esp)
	jmp	L353
	.p2align 2,,3
L184:
	cmpl	$42, %eax
	je	L367
	cmpl	$10, %eax
	je	L458
	cmpl	$12, %eax
	je	L459
	cmpl	$20, %eax
	je	L460
	cmpl	$21, %eax
	je	L461
L387:
	movb	$0, 175(%esp)
L230:
	cmpb	$0, 174(%esp)
	jne	L354
L357:
	call	_al_flip_display
	cmpb	$0, 175(%esp)
	jne	L462
L353:
	leal	1064(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%ebx, (%esp)
	call	_al_wait_for_event
	movl	1064(%esp), %eax
	cmpl	$30, %eax
	jne	L184
	cmpl	$2, 168(%esp)
	je	L463
L389:
	movb	$0, 175(%esp)
L185:
	movb	$1, 174(%esp)
L354:
	movl	%ebx, (%esp)
	call	_al_is_event_queue_empty
	testb	%al, %al
	je	L333
	cmpl	$1, 168(%esp)
	je	L464
L333:
	cmpb	$0, 174(%esp)
	je	L357
	movl	%ebx, (%esp)
	call	_al_is_event_queue_empty
	testb	%al, %al
	je	L338
	cmpl	$2, 168(%esp)
	je	L465
L338:
	movl	%ebx, (%esp)
	call	_al_is_event_queue_empty
	testb	%al, %al
	je	L350
	cmpl	$3, 168(%esp)
	je	L466
	.p2align 2,,3
L350:
	movl	%ebx, (%esp)
	call	_al_is_event_queue_empty
	testb	%al, %al
	je	L357
	cmpl	$4, 168(%esp)
	jne	L357
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	leal	864(%esp), %edx
	movl	%edx, (%esp)
	call	_al_map_rgb
	movl	%esp, %edi
	movl	188(%esp), %esi
	movl	168(%esp), %ecx
	rep movsl
	call	_al_clear_to_color
	movl	$255, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	leal	880(%esp), %eax
	movl	%eax, (%esp)
	call	_al_map_rgb
	movl	$LC82, 32(%esp)
	movl	$0, 28(%esp)
	movl	$0x41a00000, 24(%esp)
	movl	$0x43b40000, 20(%esp)
	movl	176(%esp), %edi
	movl	184(%esp), %esi
	movl	168(%esp), %ecx
	rep movsl
	movl	112(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_textf
	leal	896(%esp), %esi
	movl	$255, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	$LC83, 32(%esp)
	movl	$0, 28(%esp)
	movl	$0x42700000, 24(%esp)
	movl	$0x43b40000, 20(%esp)
	leal	4(%esp), %edx
	movl	%edx, 176(%esp)
	movl	%edx, %edi
	movl	168(%esp), %ecx
	rep movsl
	movl	112(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_textf
	movb	$0, 174(%esp)
	jmp	L357
L458:
	cmpl	$2, 168(%esp)
	jne	L387
	movl	1084(%esp), %eax
	cmpl	$75, %eax
	je	L238
	jg	L244
	cmpl	$19, %eax
	je	L236
	jle	L467
	cmpl	$23, %eax
	je	L237
L450:
	cmpl	$59, %eax
	jne	L387
	.p2align 2,,3
L367:
	movb	$1, 175(%esp)
	jmp	L230
L459:
	cmpl	$2, 168(%esp)
	je	L249
	cmpl	$3, 168(%esp)
	je	L250
	cmpl	$1, 168(%esp)
	jne	L387
L250:
	cmpl	$59, 1084(%esp)
	sete	175(%esp)
	jmp	L230
L462:
	movl	%ebx, (%esp)
	call	_al_destroy_event_queue
	movl	144(%esp), %eax
	movl	%eax, (%esp)
	call	_al_destroy_timer
	movl	164(%esp), %eax
	movl	%eax, (%esp)
	call	_al_destroy_bitmap
	movl	156(%esp), %eax
	movl	%eax, (%esp)
	call	_al_destroy_bitmap
	movl	160(%esp), %eax
	movl	%eax, (%esp)
	call	_al_destroy_display
	xorl	%eax, %eax
L433:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
L463:
	incl	_cont
	movl	1776(%esp), %eax
	movl	%eax, 16(%esp)
	movl	1760(%esp), %eax
	movl	%eax, 12(%esp)
	movl	1924(%esp), %eax
	movl	%eax, 8(%esp)
	movl	1908(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC26, (%esp)
	call	_printf
	movl	$0, 4(%esp)
	leal	1688(%esp), %eax
	movl	%eax, (%esp)
	call	__Z12UpdateSpriteP9SpaceShipi
	movl	$1, 4(%esp)
	leal	1688(%esp), %edx
	movl	%edx, (%esp)
	call	__Z12UpdateSpriteP9SpaceShipi
	movl	_cont, %eax
	cmpl	$63, %eax
	je	L468
	movl	$25, %ecx
	cltd
	idivl	%ecx
	testl	%edx, %edx
	je	L188
L189:
	movl	104(%esp), %eax
	cmpl	%eax, _timeLevel
	je	L469
L190:
	movl	$0, 12(%esp)
	leal	1024(%esp), %eax
	movl	%eax, 8(%esp)
	leal	944(%esp), %edx
	movl	%edx, 4(%esp)
	leal	1688(%esp), %eax
	movl	%eax, (%esp)
	call	__Z4jumpP9SpaceShipPKiS2_i
	movl	$1, 12(%esp)
	leal	1024(%esp), %edx
	movl	%edx, 8(%esp)
	leal	944(%esp), %eax
	movl	%eax, 4(%esp)
	leal	1688(%esp), %edx
	movl	%edx, (%esp)
	call	__Z4jumpP9SpaceShipPKiS2_i
	cmpl	$410, 1844(%esp)
	jle	L191
	movl	1840(%esp), %eax
	subl	$418, %eax
	cmpl	$327, %eax
	ja	L191
L192:
	cmpl	$410, 1696(%esp)
	jle	L193
	movl	1692(%esp), %eax
	subl	$418, %eax
	cmpl	$327, %eax
	jbe	L194
L193:
	leal	1024(%esp), %edx
	movl	%edx, 12(%esp)
	leal	984(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	leal	1688(%esp), %edx
	movl	%edx, (%esp)
	call	__Z5golpeP9SpaceShipiPKiS2_
L194:
	leal	1128(%esp), %eax
	movl	%eax, 16(%esp)
	movl	$1, 12(%esp)
	leal	1024(%esp), %edx
	movl	%edx, 8(%esp)
	leal	984(%esp), %eax
	movl	%eax, 4(%esp)
	leal	1688(%esp), %edx
	movl	%edx, (%esp)
	call	__Z3hitP9SpaceShipPKiS2_iPKf
	leal	1128(%esp), %eax
	movl	%eax, 16(%esp)
	movl	$0, 12(%esp)
	leal	1024(%esp), %edx
	movl	%edx, 8(%esp)
	leal	984(%esp), %eax
	movl	%eax, 4(%esp)
	leal	1688(%esp), %edx
	movl	%edx, (%esp)
	call	__Z3hitP9SpaceShipPKiS2_iPKf
	cmpb	$0, _keys+9
	je	L195
	cmpl	$9, 1760(%esp)
	je	L195
	cmpb	$0, _fire1
	jne	L470
L195:
	cmpb	$0, _keys+4
	je	L196
	cmpl	$9, 1908(%esp)
	je	L196
	cmpb	$0, _fire2
	jne	L471
L196:
	cmpb	$0, _keys+7
	je	L197
	cmpl	$0, 120(%esp)
	jne	L197
	cmpl	$410, 1844(%esp)
	jg	L472
L199:
	movl	1852(%esp), %eax
	addl	%eax, 1840(%esp)
L200:
	cmpb	$0, _keys+5
	jne	L203
L202:
	cmpb	$0, _keys+2
	je	L207
	cmpl	$0, 120(%esp)
	jne	L207
L208:
	cmpl	$410, 1696(%esp)
	jg	L473
L209:
	movl	1704(%esp), %eax
	subl	%eax, 1692(%esp)
L210:
	cmpb	$0, _keys+3
	jne	L213
L212:
	cmpb	$0, 1720(%esp)
	jne	L217
	cmpl	$0, 120(%esp)
	jne	L217
L218:
	movl	1692(%esp), %eax
	subl	$418, %eax
	cmpl	$327, %eax
	ja	L474
	movl	1696(%esp), %eax
	leal	-401(%eax), %edx
	cmpl	$8, %edx
	jbe	L220
	addl	$7, %eax
	movl	%eax, 1696(%esp)
	jmp	L220
L197:
	cmpb	$0, _keys+5
	je	L202
	cmpl	$0, 120(%esp)
	jne	L202
L203:
	cmpl	$410, 1844(%esp)
	jg	L475
L204:
	movl	1852(%esp), %eax
	subl	%eax, 1840(%esp)
L205:
	cmpb	$0, _keys+2
	jne	L208
L207:
	cmpb	$0, _keys+3
	je	L212
	cmpl	$0, 120(%esp)
	jne	L212
L213:
	cmpl	$410, 1696(%esp)
	jg	L476
L214:
	movl	1704(%esp), %eax
	addl	%eax, 1692(%esp)
L215:
	cmpb	$0, 1720(%esp)
	je	L218
L217:
	cmpb	$0, 1868(%esp)
	je	L477
L222:
	movl	$0, 8(%esp)
	leal	1688(%esp), %eax
	movl	%eax, 4(%esp)
	leal	1208(%esp), %edx
	movl	%edx, (%esp)
	call	__Z12UpdateBulletP6BulletP9SpaceShipi
	movl	$0, 8(%esp)
	leal	1688(%esp), %eax
	movl	%eax, 4(%esp)
	leal	1208(%esp), %edx
	movl	%edx, (%esp)
	call	__Z13CollideBulletP6BulletP9SpaceShipi
	movl	$1, 8(%esp)
	leal	1688(%esp), %eax
	movl	%eax, 4(%esp)
	leal	1448(%esp), %edx
	movl	%edx, (%esp)
	call	__Z12UpdateBulletP6BulletP9SpaceShipi
	movl	$1, 8(%esp)
	leal	1688(%esp), %eax
	movl	%eax, 4(%esp)
	leal	1448(%esp), %edx
	movl	%edx, (%esp)
	call	__Z13CollideBulletP6BulletP9SpaceShipi
	movl	$1, 4(%esp)
	leal	912(%esp), %esi
	movl	%esi, (%esp)
	call	__Z11UpdateCometP5Cometi
	leal	1688(%esp), %eax
	movl	%eax, 12(%esp)
	movl	$0, 8(%esp)
	movl	$1, 4(%esp)
	movl	%esi, (%esp)
	call	__Z12CollideCometP5CometiiP9SpaceShip
	leal	1688(%esp), %edx
	movl	%edx, 12(%esp)
	movl	$1, 8(%esp)
	movl	$1, 4(%esp)
	movl	%esi, (%esp)
	call	__Z12CollideCometP5CometiiP9SpaceShip
	cmpl	$0, 1700(%esp)
	jle	L478
L226:
	cmpl	$719, 1696(%esp)
	jg	L479
L227:
	cmpl	$1, 1848(%esp)
	jle	L480
L228:
	cmpl	$719, 1844(%esp)
	jle	L389
	leal	1688(%esp), %edx
	movl	%edx, (%esp)
	call	__Z8InitShipP9SpaceShip
	movl	$0, _timeLevel
	jmp	L389
L191:
	leal	1024(%esp), %eax
	movl	%eax, 12(%esp)
	leal	984(%esp), %edx
	movl	%edx, 8(%esp)
	movl	$1, 4(%esp)
	leal	1688(%esp), %eax
	movl	%eax, (%esp)
	call	__Z5golpeP9SpaceShipiPKiS2_
	jmp	L192
L460:
	movl	1084(%esp), %eax
	movl	%eax, 100(%esp)
	movl	1088(%esp), %edx
	movl	%edx, 96(%esp)
	cmpl	$1, 168(%esp)
	je	L268
	cmpl	$3, 168(%esp)
	je	L481
L385:
	movl	$0, 116(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L477:
	cmpl	$0, 120(%esp)
	jne	L222
L223:
	movl	1840(%esp), %eax
	subl	$418, %eax
	cmpl	$327, %eax
	ja	L482
	movl	1844(%esp), %eax
	leal	-401(%eax), %edx
	cmpl	$8, %edx
	jbe	L222
	addl	$7, %eax
	movl	%eax, 1844(%esp)
	jmp	L222
L244:
	cmpl	$84, %eax
	je	L241
	jle	L483
	cmpl	$85, %eax
	je	L242
	cmpl	$91, %eax
	jne	L387
	movb	$1, _keys+9
	movb	$0, 175(%esp)
	cmpl	$9, 1760(%esp)
	jne	L230
	movb	$1, 1740(%esp)
	jmp	L230
L468:
	incl	_timeLevel
	movl	$0, _cont
L188:
	movb	$1, _fire1
	movb	$1, _fire2
	jmp	L189
L481:
	movl	100(%esp), %eax
	subl	$52, %eax
	cmpl	$39, %eax
	ja	L270
	movl	96(%esp), %eax
	subl	$375, %eax
	cmpl	$55, %eax
	ja	L270
L375:
	movl	$1, 116(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L457:
	movl	$LC24, (%esp)
L448:
	call	_printf
	movl	144(%esp), %eax
	movl	%eax, (%esp)
	call	_al_destroy_timer
	movl	160(%esp), %eax
	movl	%eax, (%esp)
	call	_al_destroy_display
	movl	%ebx, (%esp)
	call	_al_destroy_event_queue
	xorl	%eax, %eax
	jmp	L433
L270:
	movl	100(%esp), %eax
	subl	$195, %eax
	cmpl	$61, %eax
	ja	L271
	movl	96(%esp), %eax
	subl	$370, %eax
	cmpl	$60, %eax
	ja	L271
L376:
	movl	$2, 116(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L271:
	movl	100(%esp), %eax
	subl	$318, %eax
	cmpl	$55, %eax
	jbe	L484
L272:
	movl	100(%esp), %eax
	subl	$474, %eax
	cmpl	$56, %eax
	ja	L273
	movl	96(%esp), %eax
	subl	$372, %eax
	cmpl	$58, %eax
	ja	L273
	movl	$4, 116(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L451:
	movl	$LC10, (%esp)
	call	_printf
	xorl	%eax, %eax
	jmp	L433
L466:
	leal	816(%esp), %esi
	movl	$255, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	$4, %ecx
	movl	%esp, %edi
	rep movsl
	call	_al_clear_to_color
	movl	$0, 12(%esp)
	movl	$0x00000000, 8(%esp)
	movl	$0x00000000, 4(%esp)
	movl	164(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_bitmap
	movl	$0, 12(%esp)
	movl	$0x00000000, 8(%esp)
	movl	$0xc3160000, 4(%esp)
	movl	132(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_bitmap
	movl	$0, 12(%esp)
	movl	$0x00000000, 8(%esp)
	movl	$0x42fa0000, 4(%esp)
	movl	140(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_bitmap
	movl	$0, 12(%esp)
	movl	$0x42200000, 8(%esp)
	movl	$0x440ec000, 4(%esp)
	movl	136(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_bitmap
	leal	832(%esp), %esi
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	104(%esp), %edx
	movl	%edx, 36(%esp)
	movl	$LC9, 32(%esp)
	movl	$0, 28(%esp)
	movl	$0x43ed8000, 24(%esp)
	movl	$0x43848000, 20(%esp)
	movl	$4, %ecx
	movl	176(%esp), %edi
	rep movsl
	movl	108(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_textf
	leal	848(%esp), %esi
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	92(%esp), %edx
	movl	%edx, 36(%esp)
	movl	$LC9, 32(%esp)
	movl	$0, 28(%esp)
	movl	$0x441b0000, 24(%esp)
	movl	$0x43ac8000, 20(%esp)
	leal	4(%esp), %eax
	movl	%eax, 176(%esp)
	movl	$4, %ecx
	movl	%eax, %edi
	rep movsl
	movl	108(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_textf
	movb	$0, 174(%esp)
	jmp	L357
L465:
	leal	704(%esp), %esi
	movl	$255, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	$4, %ecx
	movl	%esp, %edi
	rep movsl
	call	_al_clear_to_color
	movl	1696(%esp), %eax
	subl	$400, %eax
	cmpl	$6, %eax
	ja	L340
	movl	1692(%esp), %eax
	subl	$410, %eax
	cmpl	$335, %eax
	ja	L340
	movl	$0, 1728(%esp)
L340:
	movl	1844(%esp), %eax
	subl	$400, %eax
	cmpl	$6, %eax
	ja	L341
	movl	1840(%esp), %eax
	subl	$410, %eax
	cmpl	$335, %eax
	ja	L341
	movl	$0, 1876(%esp)
L341:
	leal	720(%esp), %esi
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	leal	16(%esp), %edx
	movl	%edx, 180(%esp)
	movl	$4, %ecx
	movl	%edx, %edi
	rep movsl
	movl	$0x43fa0000, 12(%esp)
	movl	$0x44480000, 8(%esp)
	movl	$0x43c80000, 4(%esp)
	movl	$0x43480000, (%esp)
	call	_al_draw_filled_rectangle
	movl	$1, 4(%esp)
	leal	912(%esp), %esi
	movl	%esi, (%esp)
	call	__Z10StartCometP5Cometi
	movl	$0, 12(%esp)
	movl	$0x00000000, 8(%esp)
	movl	$0x00000000, 4(%esp)
	movl	164(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_bitmap
	movl	$1, 4(%esp)
	movl	%esi, (%esp)
	call	__Z9DrawCometP5Cometi
	movl	$0, 8(%esp)
	leal	1688(%esp), %edx
	movl	%edx, 4(%esp)
	leal	1208(%esp), %eax
	movl	%eax, (%esp)
	call	__Z10DrawBulletP6BulletP9SpaceShipi
	movl	$1, 8(%esp)
	leal	1688(%esp), %edx
	movl	%edx, 4(%esp)
	leal	1448(%esp), %eax
	movl	%eax, (%esp)
	call	__Z10DrawBulletP6BulletP9SpaceShipi
	leal	1688(%esp), %edx
	movl	%edx, (%esp)
	call	__Z8DrawShipP9SpaceShip
	cmpb	$0, _keys+3
	jne	L485
	movl	1784(%esp), %eax
	cmpb	$0, _keys+2
	jne	L486
	cmpl	$0, 1736(%esp)
	je	L345
	movl	$0, 28(%esp)
	movl	1696(%esp), %edx
	subl	$100, %edx
	movl	%edx, 216(%esp)
	fildl	216(%esp)
	fstps	24(%esp)
	movl	1692(%esp), %edx
	subl	$50, %edx
	movl	%edx, 216(%esp)
	fildl	216(%esp)
	fstps	20(%esp)
	fildl	1780(%esp)
	fstps	16(%esp)
	movl	%eax, 216(%esp)
	fildl	216(%esp)
	fstps	12(%esp)
	fildl	1808(%esp)
	fstps	8(%esp)
	leal	(%eax,%eax,8), %eax
	movl	%eax, 216(%esp)
	fildl	216(%esp)
	fstps	4(%esp)
	movl	152(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_bitmap_region
L343:
	cmpb	$0, _keys+7
	jne	L487
	movl	1932(%esp), %eax
	cmpb	$0, _keys+5
	jne	L488
	cmpl	$0, 1884(%esp)
	je	L349
	movl	$0, 28(%esp)
	movl	1844(%esp), %edx
	subl	$100, %edx
	movl	%edx, 216(%esp)
	fildl	216(%esp)
	fstps	24(%esp)
	movl	1840(%esp), %edx
	subl	$50, %edx
	movl	%edx, 216(%esp)
	fildl	216(%esp)
	fstps	20(%esp)
	fildl	1928(%esp)
	fstps	16(%esp)
	movl	%eax, 216(%esp)
	fildl	216(%esp)
	fstps	12(%esp)
	fildl	1956(%esp)
	fstps	8(%esp)
	leal	(%eax,%eax,8), %eax
	movl	%eax, 216(%esp)
	fildl	216(%esp)
	fstps	4(%esp)
	movl	148(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_bitmap_region
L347:
	leal	736(%esp), %esi
	movl	$255, 12(%esp)
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	leal	24(%esp), %edi
	movl	$4, %ecx
	rep movsl
	movl	$0x41200000, 20(%esp)
	movl	$0x41200000, 16(%esp)
	movl	$0x420c0000, 12(%esp)
	movl	$0x44480000, 8(%esp)
	movl	$0x00000000, 4(%esp)
	flds	LC63
	fsts	(%esp)
	fstps	64(%esp)
	call	_al_draw_filled_rounded_rectangle
	leal	752(%esp), %esi
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	leal	24(%esp), %edi
	movl	$4, %ecx
	rep movsl
	movl	$0x41200000, 20(%esp)
	movl	$0x41200000, 16(%esp)
	movl	$0x420c0000, 12(%esp)
	flds	LC67
	fld	%st(0)
	fimull	1700(%esp)
	flds	64(%esp)
	fld	%st(0)
	fadd	%st, %st(2)
	fxch	%st(2)
	fstps	8(%esp)
	movl	$0x00000000, 4(%esp)
	fstps	(%esp)
	fxch	%st(1)
	fstpl	64(%esp)
	fstpl	48(%esp)
	call	_al_draw_filled_rounded_rectangle
	leal	768(%esp), %esi
	movl	$0, 12(%esp)
	movl	$255, 8(%esp)
	movl	$0, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	fldl	64(%esp)
	fimull	1848(%esp)
	leal	24(%esp), %edi
	movl	$4, %ecx
	rep movsl
	movl	$0x41200000, 20(%esp)
	movl	$0x41200000, 16(%esp)
	movl	$0x420c0000, 12(%esp)
	movl	$0x44480000, 8(%esp)
	movl	$0x00000000, 4(%esp)
	fldl	48(%esp)
	fadd	%st(1), %st
	fxch	%st(1)
	fsubrs	LC68
	fadd	%st(0), %st
	faddp	%st, %st(1)
	fstps	(%esp)
	call	_al_draw_filled_rounded_rectangle
	leal	784(%esp), %esi
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	$4, %ecx
	movl	180(%esp), %edi
	rep movsl
	movl	$0x420c0000, 12(%esp)
	movl	$0x43ff0000, 8(%esp)
	movl	$0x00000000, 4(%esp)
	movl	$0x43f50000, (%esp)
	call	_al_draw_filled_rectangle
	movl	1848(%esp), %eax
	movl	1700(%esp), %edi
	leal	800(%esp), %esi
	movl	$255, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	movl	%eax, 88(%esp)
	call	_al_map_rgb
	movl	88(%esp), %eax
	movl	%eax, 40(%esp)
	movl	%edi, 36(%esp)
	movl	$LC71, 32(%esp)
	movl	$0, 28(%esp)
	movl	$0x40a00000, 24(%esp)
	movl	$0x435c0000, 20(%esp)
	movl	$4, %ecx
	movl	176(%esp), %edi
	rep movsl
	movl	128(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_textf
	movl	%ebx, (%esp)
	call	_al_is_event_queue_empty
	jmp	L350
L485:
	movl	$0, 28(%esp)
	movl	1696(%esp), %eax
	subl	$100, %eax
	movl	%eax, 216(%esp)
	fildl	216(%esp)
	fstps	24(%esp)
	movl	1692(%esp), %eax
	subl	$50, %eax
	movl	%eax, 216(%esp)
	fildl	216(%esp)
	fstps	20(%esp)
	fildl	1780(%esp)
	fstps	16(%esp)
	fildl	1784(%esp)
	fstps	12(%esp)
	fildl	1808(%esp)
	fstps	8(%esp)
	fildl	1804(%esp)
	fstps	4(%esp)
	movl	152(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_bitmap_region
	jmp	L343
L487:
	movl	$0, 28(%esp)
	movl	1844(%esp), %eax
	subl	$100, %eax
	movl	%eax, 216(%esp)
	fildl	216(%esp)
	fstps	24(%esp)
	movl	1840(%esp), %eax
	subl	$50, %eax
	movl	%eax, 216(%esp)
	fildl	216(%esp)
	fstps	20(%esp)
	fildl	1928(%esp)
	fstps	16(%esp)
	fildl	1932(%esp)
	fstps	12(%esp)
	fildl	1956(%esp)
	fstps	8(%esp)
	fildl	1952(%esp)
	fstps	4(%esp)
	movl	148(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_bitmap_region
	jmp	L347
L349:
	fildl	1928(%esp)
	movl	$0, 36(%esp)
	fsts	32(%esp)
	movl	%eax, %edx
	negl	%edx
	movl	%edx, 216(%esp)
	fildl	216(%esp)
	fstps	28(%esp)
	movl	1844(%esp), %edx
	subl	$100, %edx
	movl	%edx, 216(%esp)
	fildl	216(%esp)
	fstps	24(%esp)
	movl	1840(%esp), %edx
	leal	-50(%eax,%edx), %edx
	movl	%edx, 216(%esp)
	fildl	216(%esp)
	fstps	20(%esp)
	fstps	16(%esp)
	movl	%eax, 216(%esp)
	fildl	216(%esp)
	fstps	12(%esp)
	fildl	1956(%esp)
	fstps	8(%esp)
	leal	(%eax,%eax,8), %eax
	movl	%eax, 216(%esp)
	fildl	216(%esp)
	fstps	4(%esp)
	movl	148(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_scaled_bitmap
	jmp	L347
L345:
	fildl	1780(%esp)
	movl	$0, 36(%esp)
	fsts	32(%esp)
	movl	%eax, %edx
	negl	%edx
	movl	%edx, 216(%esp)
	fildl	216(%esp)
	fstps	28(%esp)
	movl	1696(%esp), %edx
	subl	$100, %edx
	movl	%edx, 216(%esp)
	fildl	216(%esp)
	fstps	24(%esp)
	movl	1692(%esp), %edx
	leal	-50(%eax,%edx), %edx
	movl	%edx, 216(%esp)
	fildl	216(%esp)
	fstps	20(%esp)
	fstps	16(%esp)
	movl	%eax, 216(%esp)
	fildl	216(%esp)
	fstps	12(%esp)
	fildl	1808(%esp)
	fstps	8(%esp)
	leal	(%eax,%eax,8), %eax
	movl	%eax, 216(%esp)
	fildl	216(%esp)
	fstps	4(%esp)
	movl	152(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_scaled_bitmap
	jmp	L343
L486:
	fildl	1780(%esp)
	movl	$0, 36(%esp)
	fsts	32(%esp)
	movl	%eax, %edx
	negl	%edx
	movl	%edx, 216(%esp)
	fildl	216(%esp)
	fstps	28(%esp)
	movl	1696(%esp), %edx
	subl	$100, %edx
	movl	%edx, 216(%esp)
	fildl	216(%esp)
	fstps	24(%esp)
	movl	1692(%esp), %edx
	leal	-50(%eax,%edx), %edx
	movl	%edx, 216(%esp)
	fildl	216(%esp)
	fstps	20(%esp)
	fstps	16(%esp)
	movl	%eax, 216(%esp)
	fildl	216(%esp)
	fstps	12(%esp)
	fildl	1808(%esp)
	fstps	8(%esp)
	fildl	1804(%esp)
	fstps	4(%esp)
	movl	152(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_scaled_bitmap
	jmp	L343
L488:
	fildl	1928(%esp)
	movl	$0, 36(%esp)
	fsts	32(%esp)
	movl	%eax, %edx
	negl	%edx
	movl	%edx, 216(%esp)
	fildl	216(%esp)
	fstps	28(%esp)
	movl	1844(%esp), %edx
	subl	$100, %edx
	movl	%edx, 216(%esp)
	fildl	216(%esp)
	fstps	24(%esp)
	movl	1840(%esp), %edx
	leal	-50(%eax,%edx), %edx
	movl	%edx, 216(%esp)
	fildl	216(%esp)
	fstps	20(%esp)
	fstps	16(%esp)
	movl	%eax, 216(%esp)
	fildl	216(%esp)
	fstps	12(%esp)
	fildl	1956(%esp)
	fstps	8(%esp)
	fildl	1952(%esp)
	fstps	4(%esp)
	movl	148(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_scaled_bitmap
	jmp	L347
L464:
	leal	688(%esp), %esi
	movl	$255, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	$4, %ecx
	movl	%esp, %edi
	rep movsl
	call	_al_clear_to_color
	movl	$0, 12(%esp)
	movl	$0x00000000, 8(%esp)
	movl	$0x00000000, 4(%esp)
	movl	164(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_bitmap
	cmpl	$2, 116(%esp)
	je	L334
	jg	L355
	cmpl	$1, 116(%esp)
	jne	L333
	movl	$0, 12(%esp)
	movl	$0x43660000, 8(%esp)
	movl	$0x44020000, 4(%esp)
	movl	156(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_bitmap
	jmp	L333
L334:
	movl	$0, 12(%esp)
	movl	$0x43b40000, 8(%esp)
	movl	$0x44020000, 4(%esp)
	movl	156(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_bitmap
	jmp	L333
L452:
	movl	$LC11, (%esp)
	call	_printf
	movl	160(%esp), %eax
	movl	%eax, (%esp)
	call	_al_destroy_display
L447:
	orl	$-1, %eax
	jmp	L433
L446:
	movl	$LC20, (%esp)
	jmp	L448
L461:
	movl	100(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC27, (%esp)
	call	_printf
	movl	96(%esp), %edx
	movl	%edx, 4(%esp)
	movl	$LC28, (%esp)
	call	_printf
	cmpl	$1, 168(%esp)
	je	L278
	cmpl	$3, 168(%esp)
	jne	L389
	movl	116(%esp), %eax
	decl	%eax
	cmpl	$10, %eax
	ja	L285
	jmp	*L297(,%eax,4)
	.section .rdata,"dr"
	.align 4
L297:
	.long	L286
	.long	L287
	.long	L288
	.long	L289
	.long	L290
	.long	L291
	.long	L292
	.long	L293
	.long	L294
	.long	L295
	.long	L296
	.section	.text.startup,"x"
L249:
	movl	1084(%esp), %eax
	cmpl	$75, %eax
	je	L257
	jle	L489
	cmpl	$84, %eax
	je	L260
	jg	L265
	cmpl	$82, %eax
	je	L258
	cmpl	$83, %eax
	jne	L387
	movb	$0, _keys+3
	movb	$0, 175(%esp)
	jmp	L230
L268:
	movl	100(%esp), %eax
	subl	$660, %eax
	cmpl	$390, %eax
	ja	L385
	movl	96(%esp), %eax
	subl	$205, %eax
	cmpl	$101, %eax
	jbe	L375
	movl	96(%esp), %eax
	subl	$330, %eax
	cmpl	$82, %eax
	jbe	L376
	movl	96(%esp), %eax
	subl	$450, %eax
	cmpl	$90, %eax
	jbe	L377
	movl	96(%esp), %eax
	subl	$570, %eax
	cmpl	$91, %eax
	sbbl	%eax, %eax
	andl	$4, %eax
	movl	%eax, 116(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L478:
	leal	1688(%esp), %eax
	movl	%eax, (%esp)
	call	__Z8InitShipP9SpaceShip
	movl	$0, _timeLevel
	jmp	L226
L480:
	leal	1688(%esp), %eax
	movl	%eax, (%esp)
	call	__Z8InitShipP9SpaceShip
	movl	$0, _timeLevel
	jmp	L228
L479:
	leal	1688(%esp), %edx
	movl	%edx, (%esp)
	call	__Z8InitShipP9SpaceShip
	movl	$0, _timeLevel
	jmp	L227
L355:
	cmpl	$3, 116(%esp)
	je	L335
	cmpl	$4, 116(%esp)
	jne	L333
	movl	$0, 12(%esp)
	movl	$0x44160000, 8(%esp)
	movl	$0x44020000, 4(%esp)
	movl	156(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_bitmap
	jmp	L333
L335:
	movl	$0, 12(%esp)
	movl	$0x43eb0000, 8(%esp)
	movl	$0x44020000, 4(%esp)
	movl	156(%esp), %eax
	movl	%eax, (%esp)
	call	_al_draw_bitmap
	jmp	L333
L482:
	addl	$7, 1844(%esp)
	jmp	L222
L474:
	addl	$7, 1696(%esp)
L220:
	cmpb	$0, 1868(%esp)
	jne	L222
	jmp	L223
L476:
	cmpl	$417, 1692(%esp)
	jg	L215
	jmp	L214
L475:
	cmpl	$745, 1840(%esp)
	jle	L205
	jmp	L204
L473:
	cmpl	$745, 1692(%esp)
	jle	L210
	jmp	L209
L472:
	cmpl	$417, 1840(%esp)
	jg	L200
	jmp	L199
L489:
	cmpl	$19, %eax
	je	L255
	jg	L264
	cmpl	$1, %eax
	je	L253
	cmpl	$4, %eax
	jne	L387
	movb	$0, _keys+7
	movb	$0, 175(%esp)
	jmp	L230
L467:
	cmpl	$1, %eax
	je	L234
	cmpl	$4, %eax
	jne	L387
	movb	$1, _keys+7
	movl	$1, 1884(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L483:
	cmpl	$82, %eax
	je	L239
	cmpl	$83, %eax
	jne	L387
	movb	$1, _keys+3
	movl	$1, 1736(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L470:
	movl	$0, 8(%esp)
	leal	1688(%esp), %eax
	movl	%eax, 4(%esp)
	leal	1208(%esp), %edx
	movl	%edx, (%esp)
	call	__Z10FireBulletP6BulletP9SpaceShipi
	movb	$0, _fire1
	jmp	L195
L471:
	movl	$1, 8(%esp)
	leal	1688(%esp), %eax
	movl	%eax, 4(%esp)
	leal	1448(%esp), %edx
	movl	%edx, (%esp)
	call	__Z10FireBulletP6BulletP9SpaceShipi
	movb	$0, _fire2
	jmp	L196
L484:
	movl	96(%esp), %eax
	subl	$372, %eax
	cmpl	$58, %eax
	ja	L272
L377:
	movl	$3, 116(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L295:
	movl	$LC44, (%esp)
	call	_puts
	xorl	%eax, %eax
	cmpl	$1, 120(%esp)
	setle	%al
	addl	%eax, 120(%esp)
L285:
	cmpl	$7, 1756(%esp)
	jbe	L490
	movl	$LC16, (%esp)
	call	_al_load_bitmap
	movl	%eax, 132(%esp)
	leal	608(%esp), %esi
L442:
	movl	$255, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	$4, %ecx
	movl	176(%esp), %edi
	rep movsl
	movl	132(%esp), %eax
	movl	%eax, (%esp)
	call	_al_convert_mask_to_alpha
	cmpl	$7, 1904(%esp)
	jbe	L491
	movl	$LC16, (%esp)
	call	_al_load_bitmap
	movl	%eax, 140(%esp)
	leal	464(%esp), %esi
L445:
	movl	$255, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	$4, %ecx
	movl	176(%esp), %edi
	rep movsl
	movl	140(%esp), %eax
	movl	%eax, (%esp)
	call	_al_convert_mask_to_alpha
	cmpl	$1, 120(%esp)
	je	L327
	cmpl	$2, 120(%esp)
	je	L328
	cmpl	$0, 120(%esp)
	jne	L492
	movl	$LC17, (%esp)
	call	_al_load_bitmap
	movl	%eax, 136(%esp)
	movl	$LC18, (%esp)
	call	_al_load_bitmap
	movl	%eax, 124(%esp)
	leal	624(%esp), %esi
L443:
	movl	$255, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	$4, %ecx
	movl	176(%esp), %edi
	rep movsl
	movl	136(%esp), %eax
	movl	%eax, (%esp)
	call	_al_convert_mask_to_alpha
	movb	$0, 175(%esp)
	jmp	L185
L294:
	movl	$LC43, (%esp)
	call	_puts
	cmpl	$1, 120(%esp)
	adcl	$-1, 120(%esp)
	jmp	L285
L293:
	movl	$LC42, (%esp)
	call	_puts
	cmpl	$1, 92(%esp)
	adcl	$-1, 92(%esp)
	movl	92(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC41, (%esp)
	call	_printf
	jmp	L285
L292:
	movl	$LC40, (%esp)
	call	_puts
	xorl	%eax, %eax
	cmpl	$4, 92(%esp)
	setle	%al
	addl	%eax, 92(%esp)
	movl	92(%esp), %edx
	movl	%edx, 4(%esp)
	movl	$LC41, (%esp)
	call	_printf
	jmp	L285
L291:
	movl	$LC39, (%esp)
	call	_puts
	cmpl	$0, 104(%esp)
	jle	L285
	subl	$10, 104(%esp)
	jmp	L285
L290:
	movl	$LC38, (%esp)
	call	_puts
	cmpl	$80, 104(%esp)
	jg	L285
	addl	$10, 104(%esp)
	jmp	L285
L296:
	movl	124(%esp), %eax
	movl	%eax, 164(%esp)
	movl	$2, 168(%esp)
	jmp	L285
L289:
	movl	$LC37, (%esp)
	call	_puts
	movl	1904(%esp), %eax
	cmpl	$6, %eax
	jg	L301
	incl	%eax
	movl	%eax, 1904(%esp)
L301:
	movl	1756(%esp), %eax
L441:
	movl	%eax, 4(%esp)
	movl	$LC34, (%esp)
	call	_printf
	jmp	L285
L288:
	movl	$LC36, (%esp)
	call	_puts
	movl	1904(%esp), %eax
	testl	%eax, %eax
	jle	L441
	decl	%eax
	movl	%eax, 1904(%esp)
	jmp	L441
L287:
	movl	$LC35, (%esp)
	call	_puts
	movl	1756(%esp), %eax
	cmpl	$6, %eax
	jg	L441
	incl	%eax
	movl	%eax, 1756(%esp)
	jmp	L441
L286:
	movl	$LC33, (%esp)
	call	_puts
	movl	1756(%esp), %eax
	testl	%eax, %eax
	jle	L441
	decl	%eax
	movl	%eax, 1756(%esp)
	jmp	L441
L469:
	leal	1688(%esp), %edx
	movl	%edx, (%esp)
	call	__Z8InitShipP9SpaceShip
	movl	$0, _timeLevel
	jmp	L190
L278:
	cmpl	$2, 116(%esp)
	je	L281
	jg	L284
	cmpl	$1, 116(%esp)
	jne	L389
	movl	$LC29, (%esp)
	call	_puts
	movl	$LC30, (%esp)
	call	_al_load_bitmap
	movl	%eax, 164(%esp)
	movl	$3, 168(%esp)
	movb	$0, 175(%esp)
	jmp	L185
L273:
	movl	100(%esp), %eax
	subl	$340, %eax
	cmpl	$26, %eax
	ja	L274
	movl	96(%esp), %eax
	subl	$485, %eax
	cmpl	$19, %eax
	ja	L493
	movl	$5, 116(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L453:
	movl	$LC19, (%esp)
	jmp	L448
L454:
	movl	$LC21, (%esp)
	jmp	L448
L455:
	movl	$LC22, (%esp)
	jmp	L448
L491:
	movl	1904(%esp), %eax
	jmp	*L325(,%eax,4)
	.section .rdata,"dr"
	.align 4
L325:
	.long	L314
	.long	L316
	.long	L317
	.long	L318
	.long	L319
	.long	L320
	.long	L321
	.long	L322
	.section	.text.startup,"x"
L321:
	movl	$LC50, (%esp)
	call	_al_load_bitmap
	movl	%eax, 140(%esp)
	leal	432(%esp), %esi
	jmp	L445
L320:
	movl	$LC49, (%esp)
	call	_al_load_bitmap
	movl	%eax, 140(%esp)
	leal	416(%esp), %esi
	jmp	L445
L319:
	movl	$LC48, (%esp)
	call	_al_load_bitmap
	movl	%eax, 140(%esp)
	leal	400(%esp), %esi
	jmp	L445
L318:
	movl	$LC47, (%esp)
	call	_al_load_bitmap
	movl	%eax, 140(%esp)
	leal	384(%esp), %esi
	jmp	L445
L317:
	movl	$LC46, (%esp)
	call	_al_load_bitmap
	movl	%eax, 140(%esp)
	leal	368(%esp), %esi
	jmp	L445
L316:
	movl	$LC45, (%esp)
	call	_al_load_bitmap
	movl	%eax, 140(%esp)
	leal	352(%esp), %esi
	jmp	L445
L314:
	movl	$LC16, (%esp)
	call	_al_load_bitmap
	movl	%eax, 140(%esp)
	leal	336(%esp), %esi
	jmp	L445
L322:
	movl	$LC51, (%esp)
	call	_al_load_bitmap
	movl	%eax, 140(%esp)
	leal	448(%esp), %esi
	jmp	L445
L456:
	movl	$LC23, (%esp)
	jmp	L448
L234:
	movb	$1, _keys+5
	movl	$0, 1884(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L239:
	movb	$1, _keys+2
	movl	$0, 1736(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L237:
	movb	$1, _keys+8
	movb	$1, 1868(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L241:
	movb	$1, _keys
	movb	$1, 1720(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L236:
	movb	$1, _keys+6
	movb	$0, 175(%esp)
	jmp	L230
L238:
	movb	$1, _keys+4
	movb	$0, 175(%esp)
	cmpl	$9, 1908(%esp)
	jne	L230
	movb	$1, 1888(%esp)
	jmp	L230
L242:
	movb	$1, _keys+1
	movb	$0, 175(%esp)
	jmp	L230
L274:
	movl	100(%esp), %eax
	subl	$412, %eax
	cmpl	$26, %eax
	ja	L275
	movl	96(%esp), %eax
	subl	$630, %eax
	cmpl	$20, %eax
	ja	L494
	movl	$7, 116(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L490:
	movl	1756(%esp), %eax
	jmp	*L313(,%eax,4)
	.section .rdata,"dr"
	.align 4
L313:
	.long	L305
	.long	L306
	.long	L307
	.long	L308
	.long	L309
	.long	L310
	.long	L311
	.long	L312
	.section	.text.startup,"x"
L311:
	movl	$LC50, (%esp)
	call	_al_load_bitmap
	movl	%eax, 132(%esp)
	leal	576(%esp), %esi
	jmp	L442
L310:
	movl	$LC49, (%esp)
	call	_al_load_bitmap
	movl	%eax, 132(%esp)
	leal	560(%esp), %esi
	jmp	L442
L309:
	movl	$LC48, (%esp)
	call	_al_load_bitmap
	movl	%eax, 132(%esp)
	leal	544(%esp), %esi
	jmp	L442
L308:
	movl	$LC47, (%esp)
	call	_al_load_bitmap
	movl	%eax, 132(%esp)
	leal	528(%esp), %esi
	jmp	L442
L307:
	movl	$LC46, (%esp)
	call	_al_load_bitmap
	movl	%eax, 132(%esp)
	leal	512(%esp), %esi
	jmp	L442
L306:
	movl	$LC45, (%esp)
	call	_al_load_bitmap
	movl	%eax, 132(%esp)
	leal	496(%esp), %esi
	jmp	L442
L305:
	movl	$LC16, (%esp)
	call	_al_load_bitmap
	movl	%eax, 132(%esp)
	leal	480(%esp), %esi
	jmp	L442
L312:
	movl	$LC51, (%esp)
	call	_al_load_bitmap
	movl	%eax, 132(%esp)
	leal	592(%esp), %esi
	jmp	L442
L264:
	cmpl	$23, %eax
	jne	L450
	movb	$0, _keys+8
	movb	$0, 175(%esp)
	jmp	L230
L265:
	cmpl	$85, %eax
	je	L261
	cmpl	$91, %eax
	jne	L387
	movb	$0, _keys+9
	movb	$0, 175(%esp)
	jmp	L230
L284:
	cmpl	$3, 116(%esp)
	je	L282
	cmpl	$4, 116(%esp)
	jne	L389
	movb	$1, 175(%esp)
	jmp	L185
L493:
	movl	96(%esp), %eax
	subl	$367, %eax
	cmpl	$158, %eax
	ja	L274
	movl	$6, 116(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L275:
	movl	100(%esp), %eax
	subl	$721, %eax
	cmpl	$49, %eax
	ja	L276
	movl	96(%esp), %eax
	subl	$354, %eax
	cmpl	$52, %eax
	ja	L276
	movl	$9, 116(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L492:
	movl	$LC17, (%esp)
	call	_al_load_bitmap
	movl	%eax, 136(%esp)
	leal	672(%esp), %esi
L444:
	movl	$255, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	$4, %ecx
	movl	176(%esp), %edi
	rep movsl
	movl	136(%esp), %eax
	movl	%eax, (%esp)
	call	_al_convert_mask_to_alpha
	movl	136(%esp), %eax
	movl	%eax, 124(%esp)
	movb	$0, 175(%esp)
	jmp	L185
L257:
	movb	$0, _keys+4
	movb	$0, 175(%esp)
	jmp	L230
L253:
	movb	$0, _keys+5
	movb	$0, 175(%esp)
	jmp	L230
L255:
	movb	$0, _keys+6
	movb	$0, 175(%esp)
	jmp	L230
L260:
	movb	$0, _keys
	movb	$0, 175(%esp)
	jmp	L230
L328:
	movl	$LC54, (%esp)
	call	_al_load_bitmap
	movl	%eax, 136(%esp)
	leal	656(%esp), %esi
	jmp	L444
L327:
	movl	$LC52, (%esp)
	call	_al_load_bitmap
	movl	%eax, 136(%esp)
	movl	$LC53, (%esp)
	call	_al_load_bitmap
	movl	%eax, 124(%esp)
	leal	640(%esp), %esi
	jmp	L443
L261:
	movb	$0, _keys+1
	movb	$0, 175(%esp)
	jmp	L230
L258:
	movb	$0, _keys+2
	movb	$0, 175(%esp)
	jmp	L230
L276:
	movl	100(%esp), %eax
	subl	$877, %eax
	cmpl	$53, %eax
	ja	L277
	movl	96(%esp), %eax
	subl	$352, %eax
	cmpl	$53, %eax
	ja	L277
	movl	$10, 116(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L281:
	movl	$LC31, (%esp)
	call	_puts
	movb	$0, 175(%esp)
	jmp	L185
L282:
	movl	$LC32, (%esp)
	call	_puts
	leal	320(%esp), %esi
	movl	$255, 12(%esp)
	movl	$255, 8(%esp)
	movl	$255, 4(%esp)
	movl	%esi, (%esp)
	call	_al_map_rgb
	movl	$4, %ecx
	movl	%esp, %edi
	rep movsl
	call	_al_clear_to_color
	movl	$4, 168(%esp)
	movb	$0, 175(%esp)
	jmp	L185
L494:
	movl	96(%esp), %eax
	subl	$654, %eax
	cmpl	$16, %eax
	ja	L275
	movl	$8, 116(%esp)
	movb	$0, 175(%esp)
	jmp	L230
L277:
	movl	100(%esp), %eax
	subl	$966, %eax
	cmpl	$74, %eax
	ja	L385
	movl	96(%esp), %eax
	subl	$612, %eax
	cmpl	$73, %eax
	sbbl	%edx, %edx
	andl	$11, %edx
	movl	%edx, 116(%esp)
	movb	$0, 175(%esp)
	jmp	L230
	.globl	_keys
	.bss
_keys:
	.space 10
	.globl	_fire2
_fire2:
	.space 1
	.globl	_fire1
_fire1:
	.space 1
	.globl	_estagio
	.align 4
_estagio:
	.space 4
	.globl	_numpulos
	.align 4
_numpulos:
	.space 4
	.globl	_timeLevel
	.align 4
_timeLevel:
	.space 4
	.globl	_cont
	.align 4
_cont:
	.space 4
	.section .rdata,"dr"
	.align 4
LC63:
	.long	1128792064
	.align 4
LC67:
	.long	1069547520
	.align 4
LC68:
	.long	1133903872
	.def	_al_map_rgb;	.scl	2;	.type	32;	.endef
	.def	_al_draw_filled_rectangle;	.scl	2;	.type	32;	.endef
	.def	_al_draw_filled_circle;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_atexit;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_al_install_system;	.scl	2;	.type	32;	.endef
	.def	_al_create_display;	.scl	2;	.type	32;	.endef
	.def	_al_init_image_addon;	.scl	2;	.type	32;	.endef
	.def	_al_install_mouse;	.scl	2;	.type	32;	.endef
	.def	_al_init_primitives_addon;	.scl	2;	.type	32;	.endef
	.def	_al_install_keyboard;	.scl	2;	.type	32;	.endef
	.def	_al_init_font_addon;	.scl	2;	.type	32;	.endef
	.def	_al_init_ttf_addon;	.scl	2;	.type	32;	.endef
	.def	_al_create_event_queue;	.scl	2;	.type	32;	.endef
	.def	_al_create_timer;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_al_load_font;	.scl	2;	.type	32;	.endef
	.def	_al_load_bitmap;	.scl	2;	.type	32;	.endef
	.def	_al_convert_mask_to_alpha;	.scl	2;	.type	32;	.endef
	.def	_al_get_keyboard_event_source;	.scl	2;	.type	32;	.endef
	.def	_al_register_event_source;	.scl	2;	.type	32;	.endef
	.def	_al_get_timer_event_source;	.scl	2;	.type	32;	.endef
	.def	_al_get_display_event_source;	.scl	2;	.type	32;	.endef
	.def	_al_get_mouse_event_source;	.scl	2;	.type	32;	.endef
	.def	_al_start_timer;	.scl	2;	.type	32;	.endef
	.def	_al_flip_display;	.scl	2;	.type	32;	.endef
	.def	_al_wait_for_event;	.scl	2;	.type	32;	.endef
	.def	_al_is_event_queue_empty;	.scl	2;	.type	32;	.endef
	.def	_al_clear_to_color;	.scl	2;	.type	32;	.endef
	.def	_al_draw_textf;	.scl	2;	.type	32;	.endef
	.def	_al_destroy_event_queue;	.scl	2;	.type	32;	.endef
	.def	_al_destroy_timer;	.scl	2;	.type	32;	.endef
	.def	_al_destroy_bitmap;	.scl	2;	.type	32;	.endef
	.def	_al_destroy_display;	.scl	2;	.type	32;	.endef
	.def	_al_draw_bitmap;	.scl	2;	.type	32;	.endef
	.def	_al_draw_bitmap_region;	.scl	2;	.type	32;	.endef
	.def	_al_draw_filled_rounded_rectangle;	.scl	2;	.type	32;	.endef
	.def	_al_draw_scaled_bitmap;	.scl	2;	.type	32;	.endef
