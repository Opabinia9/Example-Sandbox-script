USERNAME="Opabinia9"
REPONAME="Example-Sandbox-script"
NAME="Sebastion"
USEREMAIL="sebastionprice@gmail.com"
REPOS=("git-intro" "holbertonschool-shell" "holbertonschool-low_level_programming");

# Get the bashrc from git repo and save to .bashrc 
echo "hello, getting bashrc and saving your old one";
wget -qO ~/.bashrc https://raw.githubusercontent.com/$USERNAME/Example-Sandbox-script/refs/heads/main/bashrc

# Get the bash_aliases from git repo and save to .bash_aliases 
echo "hello, getting bash_aliases and saving your old one";
wget -qo ~/.bash_aliases https://raw.githubusercontent.com/$USERNAME/example-sandbox-script/refs/heads/main/bash_aliases


git config --global user.email "$USEREMAIL";
git config --global user.name "$NAME";
git config --global credential.helper 'cache --timeout=7200';

echo "and downloading your repos";
for r in "${REPOS[@]}"; do
	if [ ! -d "$HOME/$r" ]; then
		git clone "https://github.com/$USERNAME/$r.git";
	fi
done;

# USER Input repos
GrabRepo()
{
  read -p "Please enter your repo :" REPO;
  if [ ! -d "$HOME/$REPO" ]; then
    git clone "https://github.com/$USERNAME/$REPO.git";
  fi
}
GrabRepo
