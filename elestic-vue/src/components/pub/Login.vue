<template>
	<div>
		学号:<input type="text" v-model="card" placeholder="请输入学号"><br>
		密码:<input type="password" v-model="password" placeholder="请输入密码"><br>
		<button>学生登录</button><button>老师登录</button>
	</div>
</template>

<script>
	import Constant from "./Constant"
	import md5 from 'js-md5'
	export default {
		name: "Login",
		data() {
			return {
				url: Constant.data.baseUrl,
				card: '',
				password: '',
				img: '',
				now: ''
			}
		},
		methods: {
			stuLogin() {
				const self = this
				let param = new URLSearchParams()
				let pwd = md5(this.password)
				param.append('card', this.user.card)
				param.append('password', pwd)
				this.$axios({
					method: 'post',
					url: self.url + '',
					data: param
				})
					.then(function (response) {
						console.log(response.data)

					})
			},
			teaLogin() {
				const self = this
				let param = new URLSearchParams()
				let pwd = md5(this.password)
				param.append('card', this.user.card)
				param.append('password', pwd)
				this.$axios({
					method: 'post',
					url: self.url + '',
					data: param
				})
						.then(function (response) {
							console.log(response.data)

						})
			},
			getImg() {
				const self = this
				this.$axios({
					method: 'post',
					url: self.url + '',
				})
					.then(function (response) {
						console.log(response.data)
						self.img = response.data.img
						self.now = response.data.now
					})
			}
		},
		created() {
			this.getImg()
		}
	}
</script>

<style scoped>

</style>