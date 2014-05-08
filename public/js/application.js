$(document).ready(function() {
  profileLayout()
	$('#signup').on('click', signUp);
  $('#login').on('click', logIn);
  $('#cookbook').on('click', viewCookbook);
  $('#food_submit').on('submit', viewRecipes);
  $('body').on('click', '.delete', deleteItem);
});

function profileLayout() {
	$(function(){
		$("#page-wrap").wrapInner("<table cellspacing='30'><tr>");
		$(".picture").wrap("<td>");
	});
}

// VIEW RECIPES

function viewRecipes() {
	event.preventDefault();
	var response = $.ajax({
		url: '/recipes',
		data: $(this).serialize(),
		type: 'POST'
	})
	response.done(appendRecipe)
}

function appendRecipe(recipePartial) {
	$('.picture')[0].parentElement.parentElement.parentElement.parentElement.remove();
	$('#view_recipes').append(recipePartial)
  $('.add_to_cookbook').on('click', addToCookbook);
}

// MY COOKBOOK

function addToCookbook() {
	console.log("you workin?")
	var response = $.ajax({
		url: '/add/'+this.id,
		type: 'POST'
	})
	response.done(appendAddButton)
}

function appendAddButton(elementId) {
	var id = JSON.parse(elementId)
	$('#'+id).append('<p>SUCCESS!</p>');
}

function viewCookbook() {
	console.log("yay")
	var response = $.ajax({
		url: '/cookbook',
		type: 'POST'
	});
	response.done(appendCookbook);
}

function appendCookbook(cookbookPartial) {
	$('#recipe_table').remove();
	$('#view_recipes').append(cookbookPartial);
}

function deleteItem() {
	console.log("remove")
	var response = $.ajax({
		url: '/delete/'+this.classList[0],
		type: 'DELETE'
	})
	response.done(removeItem)
}

function removeItem(id) {
	id = JSON.parse(id)
	$("."+id)[0].parentElement.parentElement.remove();
}


/// SIGN IN, LOG IN, LOG OUT
function signUp() {
	var response = $.ajax({
		url: '/signup',
		type: 'POST'
	});

	response.done(appendSignUp);
}

function removeSignIn() {
	$('#signup').remove();
	$('#login').remove();
}

function appendSignUp(partial) {
	removeSignIn();
	$('.header').append(partial);
}

function logIn() {
	var response = $.ajax({
		url: '/login',
		type: 'POST'
	});

	response.done(appendLogIn);
}

function appendLogIn(partial) {
	removeSignIn()
	$('.header').append(partial);
}

