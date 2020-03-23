package main

import (
	"fmt"
	"github.com/AlecAivazis/survey/v2"
	"os/exec"
	"strings"
)

func main() {
	// Build list of tmux sessions
	ss, err := exec.Command("tmux", "ls", "-F", "\"#S\"").Output()
	if err != nil {
		fmt.Println(err)
	}
	qs := []*survey.Question{
		{
			Name: "session",
			Prompt: &survey.Select{
				Message: "Session:",
				Options: strings.Split(string(ss), "\n"),
				Default: "0",
			},
		},
	}

	// Prompt user to select a tmux session
	answers := struct {
		Session string `survey:"session"`
	}{}
	err = survey.Ask(qs, &answers)
	if err != nil {
		fmt.Println(err.Error())
		return
	}

	// Connect to session
	err = exec.Command("tmux", "attach", "-t", answers.Session).Run()
	if err != nil {
		fmt.Println(err)
	}
}
