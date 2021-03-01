import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from "../components/pub/Login";

Vue.use(VueRouter)

export default new VueRouter({
	routes: [
		{
			path: '/',
			redirect: '/index'
		},
		{
			path: '/index',
			name: 'index',
			component: Login
		},
	]
})
