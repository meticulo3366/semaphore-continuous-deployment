# Instructions

This repository serves as a one-off collaboration tool for your tutorial and
[Semaphore Community](https://semaphoreci.com/community) editors.

The repository should contain one Markdown file, any images you are using in the
article and this Readme only.

### Contributing

- Create a new branch.
- Write your new tutorial, for example `getting-started-with-rspec.md`.
- Push new branch to GitHub.
- Create a pull request to get feedback, with any notes that you think will help
  the review.
- If you’re new to this, [GitHub's
  documentation](https://help.github.com/articles/using-pull-requests/#fork--pull)
  explains it in more detail.

### Writing resources

Please make sure that you’ve read these articles before you start writing:

- [Ideas for Semaphore Community
  Articles](https://semaphoreci.com/community/tutorials/ideas-for-semaphore-community-articles)
- [How to Write an Article for the Semaphore
  Community](https://semaphoreci.com/community/tutorials/how-to-write-an-article-for-the-semaphore-community)
- [How to Format Semaphore Tutorials for
  Publishing](https://semaphoreci.com/community/tutorials/how-to-format-semaphore-tutorials-for-publishing)

# Using Ansible and Docker on Windows

Install docker and windows bash, google this!

```
sudo apt-get install software-properties-common 
sudo add-apt-repository ppa:webupd8team/java
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install oracle-java8-installer gradle ansible python-pip zip
sudo pip install awscli boto
```

# Pipeline for Windows Development

docker build -t meticulo3366/semaphore-continuous-deployment:latest .
docker push meticulo3366/semaphore-continuous-deployment:latest
bash -c 'ansible-playbook deploy.yml'

![Let's do this](https://d2l3jyjp24noqc.cloudfront.net/uploads/image/img/53/lets.jpg)
